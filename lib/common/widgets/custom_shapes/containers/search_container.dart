import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/device/devices.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.iconData,
    this.showBakcground = true,
    this.showBorder = true,
    this.onTap,
  });
  final VoidCallback? onTap;
  final String text;
  final IconData? iconData;
  final bool showBakcground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Container(
          width: TDeviceUtils.getScreenHeight(context),
          padding: const EdgeInsets.all(TSizes.md),
          decoration: BoxDecoration(
              color: showBakcground
                  ? dark
                      ? TColors.dark
                      : TColors.light
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
              border: showBorder
                  ? Border.all(color: dark ? TColors.dark : TColors.grey)
                  : null),
          child: Row(
            children: [
              Icon(iconData ?? Iconsax.search_normal,
                  color: TColors.darkerGrey),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text('Search in Store',
                  style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
        ),
      ),
    );
  }
}
