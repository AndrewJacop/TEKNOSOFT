import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_t_store/data/services/firebase_storage_service.dart';
import 'package:flutter_t_store/features/shop/models/product_model.dart';
import 'package:flutter_t_store/utils/constants/enums.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:flutter_t_store/utils/exceptions/format_exceptions.dart';
import 'package:flutter_t_store/utils/exceptions/platform_exceptions.dart';
import 'package:flutter_t_store/utils/popups/full_screen_loader.dart';
import 'package:flutter_t_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

/// Repository for managing product-related data and operations.
class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts({int limit = 4}) async {
    try {
      final snapshot = (limit == -1)
          ? await _db.collection("Products").where("IsFeatured", isEqualTo: true).get()
          : await _db.collection("Products").where("IsFeatured", isEqualTo: true).limit(4).get();

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw UtFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw UtPlatformException(e.code).message;
    } on FormatException catch (_) {
      throw const UtFormatException();
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db.collection("Products").where("IsFeatured", isEqualTo: true).get();

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw UtFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw UtPlatformException(e.code).message;
    } on FormatException catch (_) {
      throw const UtFormatException();
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productsList = querySnapshot.docs.map((e) => ProductModel.fromQuerySnapshot(e)).toList();

      return productsList;
    } on FirebaseException catch (e) {
      throw UtFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw UtPlatformException(e.code).message;
    } on FormatException catch (_) {
      throw const UtFormatException();
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  Future<List<ProductModel>> getFavouriteProducts(List<String> productIds) async {
    try {
      final snapshot = await _db.collection("Products").where(FieldPath.documentId, whereIn: productIds).get();

      return snapshot.docs.map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot)).toList();
    } on FirebaseException catch (e) {
      throw UtFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw UtPlatformException(e.code).message;
    } on FormatException catch (_) {
      throw const UtFormatException();
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  Future<List<ProductModel>> getProductsForBrand({required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = (limit == -1)
          ? await _db.collection("Products").where("Brand.Id", isEqualTo: brandId).get()
          : await _db.collection("Products").where("Brand.Id", isEqualTo: brandId).limit(limit).get();
      final products = querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;
    } on FirebaseException catch (e) {
      throw UtFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw UtPlatformException(e.code).message;
    } on FormatException catch (_) {
      throw const UtFormatException();
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  Future<List<ProductModel>> getProductsForCategory({required String categoryId, int limit = -1}) async {
    try {
      QuerySnapshot productsCategoryQuery = (limit == -1)
          ? await _db.collection("ProductCategory").where("categoryId", isEqualTo: categoryId).get()
          : await _db.collection("ProductCategory").where("categoryId", isEqualTo: categoryId).limit(limit).get();
      List<String> productIds = productsCategoryQuery.docs.map((doc) => doc["productId"] as String).toList();
      if (productIds.isEmpty) {
        return [];
      }
      final productsQuery = await _db.collection("Products").where(FieldPath.documentId, whereIn: productIds).get();
      List<ProductModel> products = productsQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;
    } on FirebaseException catch (e) {
      throw UtFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw UtPlatformException(e.code).message;
    } on FormatException catch (_) {
      throw const UtFormatException();
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  /// Upload Dummy Data to Cloud firestore
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      // Loader
      UtFullScreenLoader.openLoadingDialog("Uploading Your Data...", UtImages.cloudUploadingAimation);
      // Upload all products along with their images
      final storage = Get.put(FirebaseStorageService());

      // Loop through each product
      for (var product in products) {
        // Get image data link from local assets
        final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);

        //Upload image and get its URL
        final url = await storage.uploadImageData("Products/Images", thumbnail, product.thumbnail.toString());

        //assing URL tocategory image attribute
        product.thumbnail = url;

        //Product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imageUrl = [];
          for (var image in product.images!) {
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            // Upload image and get its URL
            final url = await storage.uploadImageData("Products/Images", assetImage, image);

            // Assigbn url to product.thumbnail attribute
            imageUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imageUrl);
        }
        // Upload variationimages
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(variation.image);

            // Upload image and get its URL
            final url = await storage.uploadImageData("Products/Images", assetImage, variation.image);

            // Assigbn url to variation.image attribute
            variation.image = url;
          }
        }

        //Store Categoryin Firestore
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
      UtFullScreenLoader.stopLoading();
      UtLoaders.successSnackBar(
          title: "Products Uploaded", message: "The products data has been successfully uploaded");
    } on FirebaseException catch (e) {
      throw UtFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const UtFormatException();
    } on PlatformException catch (e) {
      throw UtPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    } finally {
      UtFullScreenLoader.stopLoading();
    }
  }
}
