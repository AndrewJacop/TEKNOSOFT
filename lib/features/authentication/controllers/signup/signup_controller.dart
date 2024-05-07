import 'package:flutter/material.dart';
import 'package:flutter_t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_t_store/data/repositories/user/user_repository.dart';
import 'package:flutter_t_store/features/authentication/models/user_model.dart';
import 'package:flutter_t_store/features/authentication/views/signup/verify_email_screen.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/helpers/network_manager.dart';
import 'package:flutter_t_store/utils/popups/full_screen_loader.dart';
import 'package:flutter_t_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final signupFormKey = GlobalKey<FormState>();

  final email = TextEditingController(); // Controller for email input
  final firstName = TextEditingController(); // Controller for first name input
  final lastName = TextEditingController(); // Controller for last name input
  final userName = TextEditingController(); // Controller for user name input
  final password = TextEditingController(); // Controller for password input
  final phoneNumber =
      TextEditingController(); // Controller for phone number input

  final passwordHidden = true.obs;
  final termsAgreed = false.obs;

  /// -- Sign Up
  Future<void> signup() async {
    try {
      // Start Loader
      UtFullScreenLoader.openLoadingDialog(
          "We are processing your infromation...", UtImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        UtFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        // Remove Loader
        UtFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!termsAgreed.value) {
        UtLoaders.warningSnackBar(
            title: "Please Accept Privacy Policy",
            message:
                "In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.");

        // Remove Loader
        UtFullScreenLoader.stopLoading();
        return;
      }

      // register  user in Firebase Authentication & Save user data
      final userCredentials = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save Authentication user data in Firebase
      final newUser = UserModel(
          id: userCredentials.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      UtFullScreenLoader.stopLoading();

      // Show Success Message
      UtLoaders.sucessSnackBar(
          title: "Congratulations",
          message: "Your account has been created! Verify email to continue.");

      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      UtFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      UtLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
