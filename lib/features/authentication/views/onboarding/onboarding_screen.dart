import 'package:flutter/material.dart';
import 'package:flutter_t_store/features/authentication/controllers/onboarding_controller.dart';
import 'package:flutter_t_store/features/authentication/views/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:flutter_t_store/features/authentication/views/onboarding/widgets/onboarding_next_button.dart';
import 'package:flutter_t_store/features/authentication/views/onboarding/widgets/onboarding_page.dart';
import 'package:flutter_t_store/features/authentication/views/onboarding/widgets/onboarding_skip.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: UtImages.onBoardingImage1,
                title: UtTexts.onBoardingTitle1,
                subTitle: UtTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: UtImages.onBoardingImage2,
                title: UtTexts.onBoardingTitle2,
                subTitle: UtTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: UtImages.onBoardingImage3,
                title: UtTexts.onBoardingTitle3,
                subTitle: UtTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndeicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
