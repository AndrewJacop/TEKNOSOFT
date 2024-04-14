import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/styles/spacing_styles.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/constants/text_strings.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  final String title, subTitle, image;
  final VoidCallback? onPressed;

  const SuccessScreen(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.image,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: UtSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// Image
              Image.asset(
                image,
                width: UtHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: UtSizes.spaceBtwItems),

              /// Title & Subtitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: UtSizes.spaceBtwItems),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: UtSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(UtTexts.tContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
