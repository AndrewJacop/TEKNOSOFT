import 'package:flutter/material.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect(
      {super.key,
      this.height = 15.0,
      required this.width,
      this.horizontalPadding = 0.0,
      this.verticalPadding = 0.0,
      this.radius = 15.0,
      this.color});
  final double height, width, radius, horizontalPadding, verticalPadding;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final dark = UtHelperFunctions.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      child: Shimmer.fromColors(
        baseColor: dark ? const Color.fromARGB(120, 48, 48, 48) : const Color.fromARGB(120, 224, 224, 224),
        highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color ?? (dark ? UtColors.darkerGrey : UtColors.white),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}
