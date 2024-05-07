import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_t_store/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:flutter_t_store/features/authentication/views/login/login_screen.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/constants/text_strings.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UtSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image.asset(
                UtImages.deliveredEmailIllustration,
                width: UtHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: UtSizes.spaceBtwItems),

              /// Email, Title & Subtitle
              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: UtSizes.spaceBtwItems),
              Text(
                UtTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: UtSizes.spaceBtwItems),
              Text(
                UtTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: UtSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: const Text(UtTexts.done),
                ),
              ),
              const SizedBox(height: UtSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => ForgetPasswordController.instance
                      .resendPasswordResetEmail(email),
                  child: const Text(UtTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
