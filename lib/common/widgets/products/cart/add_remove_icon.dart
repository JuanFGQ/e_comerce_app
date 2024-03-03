import 'package:e_comerce_app/common/widgets/icon/circular_icon.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class JProductQuantityWithAddRemove extends StatelessWidget {
  const JProductQuantityWithAddRemove({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });
  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // minus button
        JCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: JSizes.md,
          color: JHelperFunction.isDarkMode(context)
              ? JColors.white
              : JColors.white,
          backGroundColor: JHelperFunction.isDarkMode(context)
              ? JColors.darkGrey
              : JColors.black,
          onPressed: remove,
        ),
        const SizedBox(width: JSizes.spaceBtwItems),
        //quantity indicator
        Text(quantity.toString(),
            style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: JSizes.spaceBtwItems),

        //pluss button
        JCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: JSizes.md,
          color: JHelperFunction.isDarkMode(context)
              ? JColors.white
              : JColors.black,
          backGroundColor: JColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}
