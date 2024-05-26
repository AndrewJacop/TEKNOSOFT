import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_t_store/common/widgets/success_screen/success_screen.dart';
import 'package:flutter_t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/text_strings.dart';
import 'package:flutter_t_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email Whenever Verify Screen appears & set Timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Varefication link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      UtLoaders.successSnackBar(title: "Email Sent!", message: "Please Check your inbox and verify your email.");
    } catch (e) {
      UtLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  /// Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 3), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
              title: UtTexts.yourAccountCreatedTitle,
              subTitle: UtTexts.yourAccountCreatedSubTitle,
              image: UtImages.successfulRegisterAnimation,
              onPressed: () => AuthenticationRepository.instance.screenRedirect(),
            ));
      }
    });
  }

  /// Manually Check if Email Verified
  checkEmailVarificationStatus() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
            title: UtTexts.yourAccountCreatedTitle,
            subTitle: UtTexts.yourAccountCreatedSubTitle,
            image: UtImages.successfulRegisterAnimation,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ));
    }
  }
}
