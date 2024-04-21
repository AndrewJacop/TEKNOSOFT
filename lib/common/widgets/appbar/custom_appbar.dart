import 'package:flutter/material.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/constants/sizes.dart';
import 'package:flutter_t_store/utils/device/device_utility.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.leadingIcon,
      this.actions,
      this.leadingOnPressed});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: UtSizes.md),
      child: AppBar(
          title: title,
          automaticallyImplyLeading: showBackArrow,
          actions: actions,
          leading: showBackArrow
              ? IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Iconsax.arrow_left,
                    color: isDark ? UtColors.white : UtColors.dark,
                  ))
              : leadingIcon != null
                  ? IconButton(
                      onPressed: leadingOnPressed,
                      icon: Icon(
                        leadingIcon,
                        color: isDark ? UtColors.white : UtColors.dark,
                      ))
                  : null),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(UtDeviceUtils.getAppBarHeight());
}
