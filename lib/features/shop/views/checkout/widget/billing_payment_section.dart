import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/image_strings.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = UtHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        // HEADING
        SectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          showActionButton: true,
          onPressed: () {},
        ),

        const SizedBox(height: UtSizes.spaceBtwItems / 2),

        Row(
          children: [
            RoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: darkMode ? UtColors.light : UtColors.white,
              padding: const EdgeInsets.all(UtSizes.sm),
              child: const Image(
                image: AssetImage(UtImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: UtSizes.spaceBtwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}
