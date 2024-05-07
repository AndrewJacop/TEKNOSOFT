import 'package:flutter/material.dart';
import 'package:flutter_t_store/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: UtColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              height: UtSizes.iconMd,
              width: UtSizes.iconMd,
              image: AssetImage(UtImages.google),
            ),
          ),
        ),
        const SizedBox(width: UtSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: UtColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              height: UtSizes.iconMd,
              width: UtSizes.iconMd,
              image: AssetImage(UtImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
