import 'package:flutter/material.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

import '../../icons/circular_icon.dart';

class ProductQuantityWithAddRemoveButtons extends StatelessWidget {
  const ProductQuantityWithAddRemoveButtons({super.key, required this.quantity, this.add, this.remove});

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: UtSizes.md,
          color: isDark ? UtColors.white : UtColors.black,
          backgroundColor: isDark ? UtColors.darkerGrey : UtColors.light,
          onPressed: remove,
        ),
        const SizedBox(width: UtSizes.spaceBtwItems),
        Text(quantity.toString(), style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: UtSizes.spaceBtwItems),
        CircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: UtSizes.md,
          color: UtColors.white,
          backgroundColor: UtColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}
