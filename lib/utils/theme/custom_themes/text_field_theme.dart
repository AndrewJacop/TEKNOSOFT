import 'package:flutter/material.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import '../../constants/sizes.dart';

class UtTextFormFieldTheme {
  UtTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: UtColors.darkGrey,
    suffixIconColor: UtColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: UtSizes.fontSizeMd, color: UtColors.black),
    hintStyle: const TextStyle()
        .copyWith(fontSize: UtSizes.fontSizeSm, color: UtColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: UtColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(UtSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UtColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(UtSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UtColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(UtSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UtColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(UtSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UtColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(UtSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: UtColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: UtColors.darkGrey,
    suffixIconColor: UtColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: UtSizes.fontSizeMd, color: UtColors.white),
    hintStyle: const TextStyle()
        .copyWith(fontSize: UtSizes.fontSizeSm, color: UtColors.white),
    floatingLabelStyle:
        const TextStyle().copyWith(color: UtColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(UtSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UtColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(UtSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UtColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(UtSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UtColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(UtSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UtColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(UtSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: UtColors.warning),
    ),
  );
}
