import 'package:flutter/material.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';

class CircularIcon extends StatelessWidget {
  /// A custom Circular Icon Widget with a background color
  ///
  /// Properties are:
  /// Container [width], [height], [backgroundColor]
  ///
  /// Icon [size], [color], [onPressed]
  const CircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = UtSizes.lg,
    this.onPressed,
    this.color,
    this.backgroundColor,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backgroundColor != null
              ? backgroundColor!
              : isDark
                  ? UtColors.black.withOpacity(0.9)
                  : UtColors.white.withOpacity(0.9)),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
