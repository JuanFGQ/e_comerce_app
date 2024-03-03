import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/device/devices.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class JSearchContainer extends StatelessWidget {
  const JSearchContainer({
    super.key,
    required this.text,
    this.iconData,
    this.showBakcground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: JSizes.defaultSpace),
  });
  final VoidCallback? onTap;
  final String text;
  final IconData? iconData;
  final bool showBakcground, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: JDeviceUtils.getScreenHeight(context),
          padding: const EdgeInsets.all(JSizes.md),
          decoration: BoxDecoration(
              color: showBakcground
                  ? dark
                      ? JColors.dark
                      : JColors.light
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(JSizes.cardRadiusLg),
              border: showBorder
                  ? Border.all(color: dark ? JColors.dark : JColors.grey)
                  : null),
          child: Row(
            children: [
              Icon(iconData ?? Iconsax.search_normal,
                  color: JColors.darkerGrey),
              const SizedBox(width: JSizes.spaceBtwItems),
              Text('Search in Store',
                  style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
        ),
      ),
    );
  }
}
