import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/device/devices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TAppBar extends StatelessWidget implements PreferredSize {
  const TAppBar(
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
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
        child: AppBar(
          automaticallyImplyLeading: false,
          leading: showBackArrow
              ? IconButton(
                  icon: const Icon(Iconsax.arrow_left),
                  onPressed: () => Get.back())
              : leadingIcon != null
                  ? IconButton(
                      icon: Icon(leadingIcon), onPressed: leadingOnPressed)
                  : null,
          title: title,
          actions: actions,
        ));
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
