import 'package:flutter/material.dart';
import 'package:flutter_t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_t_store/features/personalization/controllers/address_controller.dart';
import 'package:flutter_t_store/features/personalization/models/address_model.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SingleAddressTile extends StatelessWidget {
  const SingleAddressTile({super.key, required this.address, required this.onTap});

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = UtHelperFunctions.isDarkMode(context);
    final controller = AddressController.instance;

    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressId == address.id;

      return GestureDetector(
        onTap: onTap,
        child: RoundedContainer(
          width: double.infinity,
          showBorder: true,
          backgroundColor: selectedAddress ? UtColors.primary.withOpacity(0.5) : Colors.transparent,
          borderColor: selectedAddress
              ? Colors.transparent
              : dark
                  ? UtColors.darkerGrey
                  : UtColors.grey,
          padding: const EdgeInsets.all(UtSizes.md),
          margin: const EdgeInsets.only(bottom: UtSizes.spaceBtwItems),
          child: Stack(children: [
            Positioned(
                right: 5,
                top: 0.0,
                child: Icon(
                  selectedAddress ? Iconsax.tick_circle5 : null,
                  color: selectedAddress
                      ? dark
                          ? UtColors.light
                          : UtColors.dark
                      : null,
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: UtSizes.sm / 2),
                Text(address.phoneNumber, maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: UtSizes.sm / 2),
                Text(address.toString(), softWrap: true)
              ],
            )
          ]),
        ),
      );
    });
  }
}
