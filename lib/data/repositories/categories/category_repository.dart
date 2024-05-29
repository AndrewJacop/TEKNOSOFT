import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_t_store/data/services/firebase_storage_service.dart';
import 'package:flutter_t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:flutter_t_store/utils/exceptions/format_exceptions.dart';
import 'package:flutter_t_store/utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/category_model.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get All Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
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

  /// Get Sub Categories
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db.collection("Categories").where("ParentId", isEqualTo: categoryId).get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
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

  /// Upload Dummy Categories Data to Cloud Firestore
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // Upload all the Categories along with their Images
      final storage = Get.put(FirebaseStorageService());

      // Loop through each category
      for (var category in categories) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        // Upload Image and Get its URL
        final url = await storage.uploadImageData('Categories', file, category.name);

        // Assign URL to Category.image attribute
        category.image = url;

        // Store Category in Firestore
        await _db.collection("Categories").doc(category.id).set(category.toJson());
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
