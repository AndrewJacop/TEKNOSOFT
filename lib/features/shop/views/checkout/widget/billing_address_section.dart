import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/text/section_heading.dart';
import 'package:flutter_t_store/features/personalization/controllers/address_controller.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // HEADING
        SectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          showActionButton: true,
          onPressed: () => controller.selectNewAddressPopUp(context),
        ),

        controller.selectedAddress.value.id.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(controller.selectedAddress.value.name, style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: UtSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      const Icon(Icons.phone, color: Colors.grey, size: 16),
                      const SizedBox(width: UtSizes.spaceBtwItems),
                      Text(controller.selectedAddress.value.phoneNumber, style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: UtSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      const Icon(Icons.location_history, color: Colors.grey, size: 16),
                      const SizedBox(width: UtSizes.spaceBtwItems),
                      Expanded(
                        child: Text(controller.selectedAddress.value.toString(),
                            style: Theme.of(context).textTheme.bodyMedium, softWrap: true),
                      ),
                    ],
                  ),
                ],
              )
            : Text('Select Address', style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
