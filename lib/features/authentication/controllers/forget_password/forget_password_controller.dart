import 'package:flutter/material.dart';
import 'package:flutter_t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_t_store/features/authentication/views/password/reset_password_screen.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/helpers/network_manager.dart';
import 'package:flutter_t_store/utils/popups/full_screen_loader.dart';
import 'package:flutter_t_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset-Password Email
  sendPasswordResetEmail() async {
    try {
      // Start loading
      UtFullScreenLoader.openLoadingDialog('Processing your request ...', UtImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UtFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        UtFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      UtFullScreenLoader.stopLoading();

      // Show success Screen
      UtLoaders.successSnackBar(title: 'Email sent', message: "Email Link sent to reset your password.".tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      UtFullScreenLoader.stopLoading();

      // Show Error Screen
      UtLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Resend Reset-Password Email
  resendPasswordResetEmail(String email) async {
    try {
      // Start loading
      UtFullScreenLoader.openLoadingDialog('Processing your request ...', UtImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UtFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      UtFullScreenLoader.stopLoading();

      // Show success Screen
      UtLoaders.successSnackBar(title: 'Email sent', message: "Email Link sent to reset your password.".tr);
    } catch (e) {
      // Remove Loader
      UtFullScreenLoader.stopLoading();

      // Show Error Screen
      UtLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
