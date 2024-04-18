import 'package:flutter/widgets.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';

class UtShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: UtColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));

  static final horizontalProductShadow = BoxShadow(
      color: UtColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
// BoxShadow
}
