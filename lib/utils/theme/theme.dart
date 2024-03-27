import 'package:flutter/material.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/theme/custom_themes/appbar_theme.dart';
import 'package:flutter_t_store/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:flutter_t_store/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:flutter_t_store/utils/theme/custom_themes/chip_theme.dart';
import 'package:flutter_t_store/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:flutter_t_store/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:flutter_t_store/utils/theme/custom_themes/text_field_theme.dart';
import 'package:flutter_t_store/utils/theme/custom_themes/text_theme.dart';

class UtAppTheme {
  UtAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: UtColors.grey,
    brightness: Brightness.light,
    primaryColor: UtColors.primary,
    textTheme: UtTextTheme.lightTextTheme,
    chipTheme: UtChipTheme.lightChipTheme,
    scaffoldBackgroundColor: UtColors.white,
    appBarTheme: UtAppBarTheme.lightAppBarTheme,
    checkboxTheme: UtCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: UtBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: UtElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: UtOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: UtTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: UtColors.grey,
    brightness: Brightness.dark,
    primaryColor: UtColors.primary,
    textTheme: UtTextTheme.darkTextTheme,
    chipTheme: UtChipTheme.darkChipTheme,
    scaffoldBackgroundColor: UtColors.black,
    appBarTheme: UtAppBarTheme.darkAppBarTheme,
    checkboxTheme: UtCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: UtBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: UtElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: UtOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: UtTextFormFieldTheme.darkInputDecorationTheme,
  );
}
