import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_t_store/features/personalization/controllers/user_controller.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/helpers/network_manager.dart';
import 'package:flutter_t_store/utils/popups/full_screen_loader.dart';
import 'package:flutter_t_store/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  /// Variables
  final userController = Get.put(UserController());

  final localStorage = GetStorage();
  final rememberMe = false.obs;
  final passwordHidden = false.obs;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBERED_EMAIL');
    password.text = localStorage.read('REMEMBERED_PASSWORD');
    super.onInit();
  }

  /// -- Email and Password sign in
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loader
      UtFullScreenLoader.openLoadingDialog("Logging you in...", UtImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        UtFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        // Remove Loader
        UtFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBERED_EMAIL', email.text.trim());
        localStorage.write('REMEMBERED_PASSWORD', password.text.trim());
      }

      // log in user using Email and Password Authentication
      final userCredentials =
          await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      if (kDebugMode) print(userCredentials);

      // Remove Loader
      UtFullScreenLoader.stopLoading();

      // Show Success Message
      UtLoaders.successSnackBar(title: "Congratulations", message: "Your are Logged in successfully.");

      // Move to Verify Email Screen
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      UtFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      UtLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  /// -- Google sign in
  Future<void> googleSignIn() async {
    try {
      // Start Loader
      UtFullScreenLoader.openLoadingDialog("Logging you in...", UtImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        UtFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredential = await AuthenticationRepository.instance.signInWithGoogle();
      if (kDebugMode) print(userCredential);

      // Save User Data
      await userController.saveUserRecord(userCredential);

      // Remove Loader
      UtFullScreenLoader.stopLoading();

      // Show Success Message
      UtLoaders.successSnackBar(title: "Congratulations", message: "Your are Logged in successfully.");

      // Move to Verify Email Screen
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      UtFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      UtLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
