import 'package:flutter/material.dart';
import 'package:flutter_t_store/features/authentication/controllers/onbaording/onboarding_controller.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final isDark = UtHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: UtSizes.defaultSpace + 25,
      left: UtSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
            activeDotColor: isDark ? UtColors.light : UtColors.dark,
            dotHeight: 6),
      ),
    );
  }
}
