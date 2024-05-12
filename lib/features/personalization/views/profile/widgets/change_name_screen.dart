import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/appbar/custom_appbar.dart';
import 'package:flutter_t_store/features/personalization/controllers/update_name_controller.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/constants/text_strings.dart';
import 'package:flutter_t_store/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(UtSizes.defaultSpace),
        child: Column(
          children: [
            // Heading
            Text(
              'Use real name for verification. This name will appear on several pages',
              style: Theme.of(context).textTheme.labelMedium,
            ),

            const SizedBox(height: UtSizes.spaceBtwSections),

            // Form
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        UtValidator.validateRequiredField('First name', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: UtTexts.firstName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                  const SizedBox(height: UtSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        UtValidator.validateRequiredField('Last name', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: UtTexts.lastName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: UtSizes.spaceBtwSections),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUsername(),
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
