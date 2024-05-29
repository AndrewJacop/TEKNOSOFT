import 'dart:convert';

import 'package:flutter_t_store/data/repositories/products/product_repository.dart';
import 'package:flutter_t_store/features/shop/models/product_model.dart';
import 'package:flutter_t_store/utils/local_storage/storage_utility.dart';
import 'package:flutter_t_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  /// Variables
  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  // Method to initialize favourites by reading from storage
  void initFavourites() {
    final json = UtLocalStorage.instance().readData("favourites");
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  // Check if current product is inside favourites or not
  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  // Toggle product in and out of favourites
  void toggleFavouriteProduct(String productId) {
    if (!favourites.containsKey(productId)) {
      // if product is not in favourites then add it
      favourites[productId] = true;
      saveFavouritesToStorage();
      UtLoaders.customToast(message: "Product has been added to the Wishlist");
    } else {
      // if product is in favourites then remove it
      UtLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      UtLoaders.customToast(message: "Product has been removed from the Wishlist");
    }
  }

  void saveFavouritesToStorage() {
    final encodedFavourites = json.encode(favourites);
    UtLocalStorage.instance().writeData("favourites", encodedFavourites);
  }

  Future<List<ProductModel>> favouriteProducts() async {
    return await ProductRepository.instance.getFavouriteProducts(favourites.keys.toList());
  }
}
