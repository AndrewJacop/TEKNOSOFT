import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class UtChipTheme {
  UtChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: UtColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: UtColors.black),
    selectedColor: UtColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: UtColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: UtColors.darkerGrey,
    labelStyle: TextStyle(color: UtColors.white),
    selectedColor: UtColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: UtColors.white,
  );
}
