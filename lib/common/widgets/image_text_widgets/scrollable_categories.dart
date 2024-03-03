import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class JScrollableCategories extends StatelessWidget {
  const JScrollableCategories({
    super.key,
    required this.image,
    required this.title,
    this.textColor = JColors.white,
    this.backGroundColor = JColors.light,
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
        padding: const EdgeInsets.only(right: JSizes.spaceBtwItems),
        child: Column(
          children: [
            //CIRCULAR ICON
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(JSizes.sm),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: backGroundColor ??
                    (JHelperFunction.isDarkMode(context)
                        ? JColors.light
                        : JColors.light),
              ),
              child: Center(
                  child: isNetworkImage
                      ? CachedNetworkImage(
                          imageUrl: image,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.explicit_sharp)),
            ),
            const SizedBox(height: JSizes.spaceBtwItems / 2),
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
