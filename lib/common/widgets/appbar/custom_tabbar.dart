import 'package:flutter/material.dart';
import 'package:flutter_t_store/utils/constants/colors.dart';
import 'package:flutter_t_store/utils/device/device_utility.dart';
import 'package:flutter_t_store/utils/helpers/helper_functions.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// If you want to Odd the background color to tabs you have to wrap them in Material widget.
  /// To do that we need [PreferredSizedJ Widget and that 's why created custom class. [PreferredSizeWidget]

  const CustomTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final isDark = UtHelperFunctions.isDarkMode(context);
    return Material(
        color: isDark ? UtColors.black : UtColors.white,
        child: TabBar(
          tabs: tabs,
          isScrollable: true,
          indicatorColor: UtColors.primary,
          labelColor: isDark ? UtColors.white : UtColors.primary,
          unselectedLabelColor: UtColors.darkGrey,
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(UtDeviceUtils.getAppBarHeight());
}
