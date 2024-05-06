import 'package:flutter/material.dart';
import 'package:flutter_t_store/features/authentication/controllers/onbaording/onboarding_controller.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final isDark = UtHelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: UtSizes.defaultSpace,
        right: UtSizes.defaultSpace,
        child: ElevatedButton(
          onPressed: () => controller.nextPage(),
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: isDark ? UtColors.primary : UtColors.black),
          child: const Icon(Iconsax.arrow_right_3),
        ));
  }
}
