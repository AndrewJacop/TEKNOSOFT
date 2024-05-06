import 'package:flutter/material.dart';
import 'package:flutter_t_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:flutter_t_store/features/authentication/views/signup/widgets/terms_and_conditions_check_box.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/constants/text_strings.dart';
import 'package:flutter_t_store/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          /// first & last name
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        UtValidator.validateRequiredField("First name", value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: UtTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                const SizedBox(width: UtSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        UtValidator.validateRequiredField("Last name", value),
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
              controller: controller.userName,
              validator: (value) =>
                  UtValidator.validateRequiredField("User name", value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: UtTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(height: UtSizes.spaceBtwInputFields),

            /// email
            TextFormField(
              controller: controller.email,
              validator: (value) => UtValidator.validateEmail(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: UtTexts.email, prefixIcon: Icon(Iconsax.direct)),
            ),
            const SizedBox(height: UtSizes.spaceBtwInputFields),

            /// phone number
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => UtValidator.validatePhoneNumber(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: UtTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
            ),
            const SizedBox(height: UtSizes.spaceBtwInputFields),

            /// password
            Obx(() => TextFormField(
                  controller: controller.password,
                  validator: (value) => UtValidator.validatePassword(value),
                  expands: false,
                  obscureText: controller.passwordHidden.value,
                  decoration: InputDecoration(
                      labelText: UtTexts.password,
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        tooltip:
                            controller.passwordHidden.value ? "Show" : "Hide",
                        icon: Icon(controller.passwordHidden.value
                            ? Iconsax.eye
                            : Iconsax.eye_slash),
                        onPressed: () => controller.passwordHidden.value =
                            !controller.passwordHidden.value,
                      )),
                )),
            const SizedBox(height: UtSizes.spaceBtwSections),

            /// agree to terms
            const TermsAndConditionsCheckBox(),
            const SizedBox(height: UtSizes.spaceBtwSections),

            /// create account button
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                  onPressed: () => {controller.signup()},
                  child: const Text(UtTexts.createAccount)),
            ),
          ],
        ));
  }
}
