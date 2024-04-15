import 'package:flutter/material.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';

class VerticalImageTextCard extends StatelessWidget {
  const VerticalImageTextCard({
    super.key,
    required this.image,
    required this.title,
    this.textColor = UtColors.white,
    this.backgroundColor,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: UtSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(UtSizes.sm),
              decoration: BoxDecoration(
                  color: backgroundColor ??
                      (isDark ? UtColors.black : UtColors.white),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  color: (isDark ? UtColors.light : UtColors.dark),
                ),
              ),
            ),
            const SizedBox(height: UtSizes.spaceBtwItems / 2),
            SizedBox(
                width: 55,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ))
          ],
        ),
      ),
    );
  }
}
