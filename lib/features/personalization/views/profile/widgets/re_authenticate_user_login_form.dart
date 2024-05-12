import 'package:flutter/material.dart';
import 'package:flutter_t_store/features/personalization/controllers/user_controller.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/constants/text_strings.dart';
import 'package:flutter_t_store/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthenticateLoginScreen extends StatelessWidget {
  const ReAuthenticateLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: AppBar(title: const Text('Re-authenticate User')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UtSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                // Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: UtValidator.validateEmail,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: UtTexts.email,
                  ),
                ),

                const SizedBox(height: UtSizes.spaceBtwInputFields),

                // Password
                Obx(
                  () => TextFormField(
                    obscureText: controller.passwordHidden.value,
                    controller: controller.verifyPassword,
                    validator: (value) =>
                        UtValidator.validateRequiredField('Password', value),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      labelText: UtTexts.password,
                      suffixIcon: IconButton(
                        onPressed: () => controller.passwordHidden.value =
                            !controller.passwordHidden.value,
                        icon: const Icon(Iconsax.eye_slash),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: UtSizes.spaceBtwSections),

                // Verify Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () =>
                        controller.reAuthenticateEmailAndPasswordUser(),
                    child: const Text('Verify'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
