import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_t_store/data/services/firebase_storage_service.dart';
import 'package:flutter_t_store/features/shop/models/banner_model.dart';
import 'package:flutter_t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:flutter_t_store/utils/exceptions/format_exceptions.dart';
import 'package:flutter_t_store/utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get All Categories
  Future<List<BannerModel>> getAllBanners() async {
    try {
      final snapshot = await _db.collection('Banners').where('Active', isEqualTo: true).get();
      final list = snapshot.docs.map((document) => BannerModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw UtFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const UtFormatException();
    } on PlatformException catch (e) {
      throw UtPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload Banners to Cloud Firestore
  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      // Upload all the Categories along with their Images
      final storage = Get.put(FirebaseStorageService());

      // Loop through each banner
      for (var banner in banners) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(banner.imageUrl);

        // Upload Image and Get its URL
        final url = await storage.uploadImageData('Banners', file, banner.targetScreen);

        // Assign URL to Category.image attribute
        banner.imageUrl = url;

        // Store Category in Firestore
        await _db.collection("Banners").add(banner.toJson());
      }
    } on FirebaseException catch (e) {
      throw UtFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const UtFormatException();
    } on PlatformException catch (e) {
      throw UtPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
