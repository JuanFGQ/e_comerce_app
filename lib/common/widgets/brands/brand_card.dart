import 'package:e_comerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_comerce_app/common/widgets/images/circular_images.dart';
import 'package:e_comerce_app/common/widgets/text/brand_title_text_with_verified_icon.dart';
import 'package:e_comerce_app/features/shop/models/brand_model.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/enums.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class JBrandCard extends StatelessWidget {
  const JBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
    required this.brand,
  });
  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: JRoundedContainer(
        padding: const EdgeInsets.all(JSizes.sm),
        showBorder: showBorder,
        backGroundColor: Colors.transparent,
        widget: Row(
          children: [
            //ICON

            Flexible(
              child: JCircularImage(
                  image: brand.image,
                  backGroundColor: Colors.transparent,
                  isNetWorkImage: true,
                  overlayColor: JHelperFunction.isDarkMode(context)
                      ? JColors.white
                      : JColors.black),
            ),
            const SizedBox(height: JSizes.spaceBtwItems / 2),
            //TEXT
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JBrandTitleTextWithVerifiedIcon(
                      title: brand.name, brandTextSize: TextSizes.large),
                  Text('${brand.productsCount ?? 0} products',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
