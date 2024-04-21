import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = UtHelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: UtSizes.defaultSpace,
        vertical: UtSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: darkMode ? UtColors.darkerGrey : UtColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(UtSizes.cardRadiusLg),
          topRight: Radius.circular(UtSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircularIcon(
                icon: Iconsax.minus,
                backgroundColor: UtColors.darkGrey,
                width: 40,
                height: 40,
                color: UtColors.white,
              ),
              const SizedBox(width: UtSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: UtSizes.spaceBtwItems),
              const CircularIcon(
                icon: Iconsax.add,
                backgroundColor: UtColors.black,
                width: 40,
                height: 40,
                color: UtColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(UtSizes.md),
              backgroundColor: UtColors.black,
              side: const BorderSide(color: Colors.black),
            ),
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
