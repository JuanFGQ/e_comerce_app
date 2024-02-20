import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class TScrollableCategories extends StatelessWidget {
  const TScrollableCategories({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backGroundColor = TColors.light,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backGroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            //CIRCULAR ICON
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: backGroundColor ??
                    (THelperFunction.isDarkMode(context)
                        ? TColors.light
                        : TColors.light),
              ),
              child: Center(
                  child: isNetworkImage
                      ? CachedNetworkImage(
                          imageUrl: image,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.explicit_sharp)),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            //ICON SUBTITLE
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: textColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
