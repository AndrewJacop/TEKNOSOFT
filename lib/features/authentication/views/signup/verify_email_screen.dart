import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_t_store/features/authentication/views/login/login_screen.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/constants/text_strings.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
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
                "andrew@email.com",
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
                  onPressed: () {},
                  child: const Text(UtTexts.tContinue),
                ),
              ),
              const SizedBox(height: UtSizes.spaceBtwItems),
              TextButton(
                  onPressed: () {},
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
