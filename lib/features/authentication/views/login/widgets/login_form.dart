import 'package:flutter/material.dart';
import 'package:flutter_t_store/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter_t_store/features/authentication/views/password/forgot_password_screen.dart';
import 'package:flutter_t_store/features/authentication/views/signup/signup_screen.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/constants/text_strings.dart';
import 'package:flutter_t_store/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: UtSizes.spaceBtwSections),
        child: Column(
          children: [
            /// EMAIL
            TextFormField(
              controller: controller.email,
              validator: (value) => UtValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: UtTexts.email,
              ),
            ),
            const SizedBox(height: UtSizes.spaceBtwInputFields),

            /// PASSWORD
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) =>
                    UtValidator.validateRequiredField("Password", value),
                // expands: false,
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
              ),
            ),
            const SizedBox(height: UtSizes.spaceBtwInputFields / 2),

            /// Remember me & forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remeber Me
                Row(
                  children: [
                    Obx(() => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: ((value) => controller.rememberMe.value =
                            !controller.rememberMe.value))),
                    const Text(UtTexts.rememberMe)
                  ],
                ),

                /// Forget Password
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPasswordSceen()),
                    child: const Text(UtTexts.forgetPassword))
              ],
            ),
            const SizedBox(height: UtSizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: const Text(UtTexts.signIn),
              ),
            ),
            const SizedBox(height: UtSizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(
              width: double.maxFinite,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(UtTexts.createAccount),
              ),
            ),
            const SizedBox(height: UtSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
