import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/enums.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBrandTextTitle extends StatelessWidget {
  const TBrandTextTitle({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.color,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? color;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            textAlign: textAlign,
            overflow: TextOverflow.ellipsis,
            maxLines: maxLines,
            style: brandTextSize == TextSizes.small
                ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
                : brandTextSize == TextSizes.medium
                    ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
                    : brandTextSize == TextSizes.large
                        ? Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .apply(color: color)
                        : Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: color)),
      ],
    );
  }
}
