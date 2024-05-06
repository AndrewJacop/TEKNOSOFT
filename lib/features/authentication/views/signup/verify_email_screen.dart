import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_t_store/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/constants/text_strings.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      // The close icon in the opp bar is used to log out the user and redirect them to the login screen.
      // This approach is taken to handle scenarios where the user enters the registration process,
      // and the data is stored. Upon reopening the app, it checks if the email is verified.
      // If not verified, the app always navigates to the verification screen.

      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
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

              /// Title & Subtitle
              Text(
                UtTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: UtSizes.spaceBtwItems),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: UtSizes.spaceBtwItems),
              Text(
                UtTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: UtSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVarificationStatus(),
                  child: const Text(UtTexts.tContinue),
                ),
              ),
              const SizedBox(height: UtSizes.spaceBtwItems),
              TextButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: const Text(
                    UtTexts.resendEmail,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
