import 'package:flutter_t_store/data/repositories/banners/banners_repository.dart';
import 'package:flutter_t_store/features/shop/models/banner_model.dart';
import 'package:flutter_t_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  /// Variables
  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final banners = <BannerModel>[].obs;
  final _bannerRepository = Get.put(BannerRepository());

  @override
  void onInit() {
    loadBanners();
    super.onInit();
  }

  /// Update Page Navigation Dots
  void updatePageIndicator(int index) {
    carouselCurrentIndex.value = index;
  }

  /// Fetch Banner Data
  Future<void> loadBanners() async {
    try {
      // Show Loader while loading categories
      isLoading.value = true;

      // Fetch banners from data source (firebase / api)
      final allBanners = await _bannerRepository.getAllBanners();

      // Update Category List
      banners.assignAll(allBanners);
    } catch (e) {
      UtLoaders.errorSnackBar(title: 'Oh Snap', message: 'Error: $e');
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }
}
