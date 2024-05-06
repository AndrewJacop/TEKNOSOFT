import 'package:flutter/material.dart';
import 'package:flutter_t_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/constants/text_strings.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class TermsAndConditionsCheckBox extends StatelessWidget {
  const TermsAndConditionsCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Obx(() => Checkbox(
                value: controller.termsAgreed.value,
                onChanged: (value) => controller.termsAgreed.value =
                    !controller.termsAgreed.value,
              )),
        ),
        const SizedBox(width: UtSizes.spaceBtwItems),
        Text.rich(
          TextSpan(children: [
            TextSpan(
                text: '${UtTexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: UtTexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      decoration: TextDecoration.underline,
                      color: isDark ? UtColors.white : UtColors.primary,
                      decorationColor:
                          isDark ? UtColors.white : UtColors.primary,
                    )),
            TextSpan(
                text: ' ${UtTexts.and} ',
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: UtTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      decoration: TextDecoration.underline,
                      color: isDark ? UtColors.white : UtColors.primary,
                      decorationColor:
                          isDark ? UtColors.white : UtColors.primary,
                    )),
          ]),
        )
      ],
    );
  }
}
