import 'package:flutter/material.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class UploadDataTile extends StatelessWidget {
  const UploadDataTile({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });
  final String text;
  final IconData icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: UtSizes.spaceBtwItems),
        child: Row(
          children: [
            Icon(
              icon,
              size: UtSizes.iconLg,
              color: UtColors.primary,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: UtSizes.spaceBtwItems),
              child: Text(
                text,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )),
            const Icon(
              Iconsax.arrow_circle_up3,
              size: UtSizes.iconLg,
              color: UtColors.primary,
            )
          ],
        ),
      ),
    );
  }
}
