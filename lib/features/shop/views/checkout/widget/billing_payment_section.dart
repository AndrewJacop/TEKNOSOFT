import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/features/shop/controllers/checkout_controller.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = UtHelperFunctions.isDarkMode(context);
    final controller = Get.put(CheckoutController());

    return Column(
      children: [
        // HEADING
        SectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          showActionButton: true,
          onPressed: () => controller.selectPaymentMethod(context),
        ),

        const SizedBox(height: UtSizes.spaceBtwItems / 2),

        Obx(
          () => Row(
            children: [
              RoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: darkMode ? UtColors.light : UtColors.white,
                padding: const EdgeInsets.all(UtSizes.sm),
                child: Image(image: AssetImage(controller.selectedPaymentMethod.value.image), fit: BoxFit.contain),
              ),
              const SizedBox(width: UtSizes.spaceBtwItems / 2),
              Text(controller.selectedPaymentMethod.value.name, style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
      ],
    );
  }
}
