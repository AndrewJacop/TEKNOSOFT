import 'package:flutter/material.dart';
import 'package:flutter_t_store/features/authentication/views/signup/verify_email_screen.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/constants/text_strings.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      /// first & last name
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: UtTexts.firstName,
                    prefixIcon: Icon(Iconsax.user)),
              ),
            ),
            const SizedBox(width: UtSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: UtTexts.lastName,
                    prefixIcon: Icon(Iconsax.user)),
              ),
            ),
          ],
        ),
        const SizedBox(height: UtSizes.spaceBtwInputFields),

        /// username
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: UtTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
        ),
        const SizedBox(height: UtSizes.spaceBtwInputFields),

        /// email
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: UtTexts.email, prefixIcon: Icon(Iconsax.direct)),
        ),
        const SizedBox(height: UtSizes.spaceBtwInputFields),

        /// phone number
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: UtTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
        ),
        const SizedBox(height: UtSizes.spaceBtwInputFields),

        /// password
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: UtTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash)),
        ),
        const SizedBox(height: UtSizes.spaceBtwSections),

        /// agree to terms
        Row(
          children: [
            SizedBox(
              child: Checkbox(
                value: true,
                onChanged: (value) {},
              ),
            ),
            const SizedBox(width: UtSizes.spaceBtwItems),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: UtTexts.iAgreeTo,
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: " ${UtTexts.privacyPolicy}",
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: isDark ? UtColors.white : UtColors.primary,
                        decoration: TextDecoration.underline,
                      )),
              TextSpan(
                  text: UtTexts.and,
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: " ${UtTexts.termsOfUse}",
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: isDark ? UtColors.white : UtColors.primary,
                        decoration: TextDecoration.underline,
                      )),
            ]))
          ],
        ),
        const SizedBox(height: UtSizes.spaceBtwSections),

        /// create account button
        SizedBox(
          width: double.maxFinite,
          child: ElevatedButton(
              onPressed: () => {Get.to(() => const VerifyEmailScreen())},
              child: const Text(UtTexts.createAccount)),
        ),
      ],
    ));
  }
}
