import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_t_store/features/authentication/views/login/login_screen.dart';
import 'package:flutter_t_store/features/authentication/views/onboarding/onboarding_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show Relevant Screen
  screenRedirect() async {
    // Local Storage
    if (kDebugMode) {
      print("===================== GET STORAGE =====================");
      print(deviceStorage.read("IsFirstTime"));
    }
    deviceStorage.writeIfNull("IsFirstTime", true);
    deviceStorage.read("IsFirstTime") != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }
}

/* -------------------------- Emain & Password sign-in -------------------------- */

/// [Email Authentication] - Sign In
/// 
/// [Email Authentication] - Register

/// [Re Authenticatate] - ReAuthenticate User

/// [Email Varification] - Mail varification

/// [Email Authentication] - Forget Password


/* -------------------------- Federated Identity & Social sign-in -------------------------- */

/// [Google Authentication] - GOOGLE

/// [Facebook Authentication] - FACEBOOK

/* -------------------------- ./end Federated Identity & Social sign-in -------------------------- */

/// [Logout User] - Valid for any authentication.

/// DELETE USER - Remove user Auth ond Firestore Account.