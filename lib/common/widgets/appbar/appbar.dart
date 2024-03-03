import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/device/devices.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class JAppBar extends StatelessWidget implements PreferredSize {
  const JAppBar(
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
    final dark = JHelperFunction.isDarkMode(context);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: JSizes.md),
        child: AppBar(
          automaticallyImplyLeading: false,
          leading: showBackArrow
              ? IconButton(
                  icon: Icon(
                    Iconsax.arrow_left,
                    color: dark ? JColors.white : JColors.dark,
                  ),
                  onPressed: () => Get.back())
              : leadingIcon != null
                  ? IconButton(
                      icon: Icon(
                        leadingIcon,
                        color: dark ? JColors.white : JColors.dark,
                      ),
                      onPressed: leadingOnPressed)
                  : null,
          title: title,
          actions: actions,
        ));
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size.fromHeight(JDeviceUtils.getAppBarHeight());
}
