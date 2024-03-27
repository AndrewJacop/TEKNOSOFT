import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class UtElevatedButtonTheme {
  UtElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: UtColors.light,
      backgroundColor: UtColors.primary,
      disabledForegroundColor: UtColors.darkGrey,
      disabledBackgroundColor: UtColors.buttonDisabled,
      side: const BorderSide(color: UtColors.primary),
      padding: const EdgeInsets.symmetric(vertical: UtSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: UtColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UtSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: UtColors.light,
      backgroundColor: UtColors.primary,
      disabledForegroundColor: UtColors.darkGrey,
      disabledBackgroundColor: UtColors.darkerGrey,
      side: const BorderSide(color: UtColors.primary),
      padding: const EdgeInsets.symmetric(vertical: UtSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: UtColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UtSizes.buttonRadius)),
    ),
  );
}
