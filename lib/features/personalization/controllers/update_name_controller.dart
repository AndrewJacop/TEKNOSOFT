import 'package:flutter/material.dart';
import 'package:flutter_t_store/features/personalization/views/profile/profile_screen.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/popups/full_screen_loader.dart';
import 'package:flutter_t_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/helpers/network_manager.dart';
import 'user_controller.dart';

/// Controller to manage user-related functionality
class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when Home screen appears
  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  /// Fetch user name form record
  Future<void> initializeName() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUsername() async {
    try {
      // Start loading
      UtFullScreenLoader.openLoadingDialog('We are updating your Information', UtImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UtFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        UtFullScreenLoader.stopLoading();
        return;
      }

      // Update Users First & Last Name in the Firebase Firestore
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the Rx USer Value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      UtFullScreenLoader.stopLoading();

      // Show success messege
      UtLoaders.sucessSnackBar(
        title: 'Congratulations',
        message: 'Your Name has been updated successfully',
      );

      // Move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      // Remove Loader
      UtFullScreenLoader.stopLoading();
      // Show error messege
      UtLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
