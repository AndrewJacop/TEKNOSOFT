import 'package:flutter/material.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/device/device_utility.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBoarder = true,
    this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBoarder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: UtSizes.defaultSpace),
        child: Container(
          width: UtDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(UtSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? isDark
                    ? UtColors.dark
                    : UtColors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(UtSizes.cardRadiusLg),
            border: showBoarder ? Border.all(color: UtColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: UtColors.darkerGrey),
              const SizedBox(width: UtSizes.spaceBtwItems),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
