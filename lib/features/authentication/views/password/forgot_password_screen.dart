import 'package:flutter/material.dart';
import 'package:flutter_t_store/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/constants/text_strings.dart';
import 'package:flutter_t_store/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordSceen extends StatelessWidget {
  const ForgetPasswordSceen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(UtSizes.defaultSpace),
        child: Column(
          children: [
            // Headings
            Text(UtTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: UtSizes.spaceBtwItems),
            Text(UtTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: UtSizes.spaceBtwSections * 2),

            // Text Field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: UtValidator.validateEmail,
                decoration: const InputDecoration(
                    labelText: UtTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            const SizedBox(height: UtSizes.spaceBtwSections),

            //Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text(UtTexts.submit),
                onPressed: () => controller.sendPasswordResetEmail(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
