import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_t_store/features/authentication/views/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update current Index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Update current Index & Jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final deviceStorage = GetStorage();

      if (kDebugMode) {
        print("===================== GET STORAGE =====================");
        print(deviceStorage.read("IsFirstTime"));
      }

      deviceStorage.write("IsFirstTime", false);

      if (kDebugMode) {
        print("===================== GET STORAGE =====================");
        print(deviceStorage.read("IsFirstTime"));
      }

      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Update cuurent Index & Jump to last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
