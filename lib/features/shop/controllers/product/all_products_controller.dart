import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_t_store/data/repositories/products/product_repository.dart';
import 'package:flutter_t_store/features/shop/models/product_model.dart';
import 'package:flutter_t_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  /// Variables
  final repository = ProductRepository.instance;
  final RxString selectedSortOption = "Name".obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;

    switch (sortOption) {
      case "Name":
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case "Higher Price":
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case "Lower Price":
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case "Newest":
        products.sort((a, b) => a.date!.compareTo(b.date!));
        break;
      case "Sale":
        products.sort((a, b) {
          if (b.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice > 0) {
            return -1;
          } else {
            return 1;
          }
        });
        break;
      default:
        // Default sorting option: Name
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  void assignProducts(List<ProductModel> products) {
    // Assign products to the controller's products list
    this.products.assignAll(products);
    sortProducts("Name");
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];
      final products = await repository.fetchProductsByQuery(query);
      return products;
    } catch (e) {
      UtLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }
}
