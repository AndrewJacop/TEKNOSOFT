import 'package:flutter/material.dart';
import 'package:flutter_t_store/features/authentication/controllers/onboarding_controller.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/constants/text_strings.dart';
import 'package:flutter_t_store/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
        top: UtDeviceUtils.getAppBarHeight(),
        right: UtSizes.defaultSpace,
        child: TextButton(
          child: const Text(UtTexts.skip),
          onPressed: () => controller.skipPage(),
        ));
  }
}
