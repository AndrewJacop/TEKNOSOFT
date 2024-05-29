import 'package:flutter_t_store/data/repositories/products/product_repository.dart';
import 'package:flutter_t_store/features/shop/models/product_model.dart';
import 'package:flutter_t_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../data/repositories/categories/category_repository.dart';
import '../models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    loadCategories();
    super.onInit();
  }

  /// -- Load Category Data
  Future<void> loadCategories() async {
    try {
      // Show Loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source(firebase / api)
      final categories = await _categoryRepository.getAllCategories();

      // Update Category List
      allCategories.assignAll(categories);

      // Filter Featured Categories
      featuredCategories.assignAll(
        allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList(),
      );
    } catch (e) {
      UtLoaders.errorSnackBar(title: 'Oh Snap', message: 'Error: $e');
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

  /// -- Load Selected Category Data
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subCategories = await _categoryRepository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      UtLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }

  /// -- Get Category or Sub-Category Products
  Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
    try {
      // Fetch limited (4) products aganst each subCategory
      final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
      return products;
    } catch (e) {
      UtLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }
}
