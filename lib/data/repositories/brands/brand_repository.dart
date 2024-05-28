import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_t_store/data/services/firebase_storage_service.dart';
import 'package:flutter_t_store/features/shop/models/brand_model.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:flutter_t_store/utils/exceptions/format_exceptions.dart';
import 'package:flutter_t_store/utils/exceptions/platform_exceptions.dart';
import 'package:flutter_t_store/utils/popups/full_screen_loader.dart';
import 'package:flutter_t_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all Brands
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection("Brands").get();
      final result = snapshot.docs.map((document) => BrandModel.fromSnapshot(document)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw UtFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const UtFormatException();
    } on PlatformException catch (e) {
      throw UtPlatformException(e.code).message;
    } catch (e) {
      throw "Someting went wrong. Please try again";
    }
  }

  /// Get Brands for Categories
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // Query toget alldocuments where category id matches the provided categoryid
      QuerySnapshot brandCategoryQuery =
          await _db.collection("BrandCategory").where("categoryId", isEqualTo: categoryId).get();
      if (brandCategoryQuery.docs.isEmpty) {
        return [];
      }

      // Extract brandIds from the document
      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc["brandId"] as String).toList();

      // Query toget all the docments where the brandid is inthe list of brandIds, Fieldpath.documentid to Query dcuments in collection
      final brandsQuery = await _db.collection("Brands").where(FieldPath.documentId, whereIn: brandIds).limit(2).get();

      // Extract brand names or other relevant data from the documents
      List<BrandModel> brands = brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;
    } on FirebaseException catch (e) {
      throw UtFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const UtFormatException();
    } on PlatformException catch (e) {
      throw UtPlatformException(e.code).message;
    } catch (e) {
      throw "Someting went wrong. Please try again";
    }
  }

  /// Upload Dummy Brands Data to Cloud firestore
  Future<void> uploadDummyData(List<BrandModel> brands) async {
    try {
      UtFullScreenLoader.openLoadingDialog("Uploading Your Data...", UtImages.cloudUploadingAimation);
      //Upload all categoryalong with their images
      final storage = Get.put(FirebaseStorageService());

      for (var brand in brands) {
        //Get image data lin from loacalassets
        final file = await storage.getImageDataFromAssets(brand.image);

        //Upload image and get its url
        final url = await storage.uploadImageData("Brands", file, brand.name);

        //assing url to banner image attribute
        brand.image = url;

        //Store banner Firestore
        await _db.collection("Brands").doc(brand.id).set(brand.toJson());
      }
      UtFullScreenLoader.stopLoading();
      UtLoaders.successSnackBar(title: "Brands Uploaded", message: "The brands data has been successfully uploaded");
    } on FirebaseException catch (e) {
      throw UtFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const UtFormatException();
    } on PlatformException catch (e) {
      throw UtPlatformException(e.code).message;
    } catch (e) {
      throw "Someting went wrong. Please try again";
    } finally {
      UtFullScreenLoader.stopLoading();
    }
  }
}
