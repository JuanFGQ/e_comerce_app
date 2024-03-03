import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/device/devices.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class JTabBar extends StatelessWidget implements PreferredSizeWidget {
  const JTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunction.isDarkMode(context);
    return Material(
      color: dark ? JColors.black : JColors.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor: JColors.primary,
        labelColor: dark ? JColors.white : JColors.primary,
        unselectedLabelColor: JColors.darkGrey,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(JDeviceUtils.getAppBarHeight());
}
