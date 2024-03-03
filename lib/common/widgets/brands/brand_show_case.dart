import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_comerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_comerce_app/common/widgets/brands/brand_card.dart';
import 'package:e_comerce_app/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:e_comerce_app/features/shop/models/brand_model.dart';
import 'package:e_comerce_app/features/shop/screens/brands/brand_products.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JBrandShowCase extends StatelessWidget {
  const JBrandShowCase({
    super.key,
    required this.images,
    required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProductsScreen(brand: brand)),
      child: JRoundedContainer(
        showBorder: true,
        borderColor: JColors.darkGrey,
        backGroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: JSizes.spaceBtwItems),
        widget: Column(
          children: [
            //BRAND with product count
            JBrandCard(showBorder: false, brand: brand),
            const SizedBox(height: JSizes.spaceBtwItems),

            // TBrand TOP 3 PRODUCT IMAGES
            Row(
                children: images
                    .map((image) => brandTopProductImageWidget(image, context))
                    .toList())
          ],
        ),
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
      child: JRoundedContainer(
          height: 100,
          padding: const EdgeInsets.all(JSizes.md),
          margin: const EdgeInsets.only(right: JSizes.sm),
          backGroundColor: JHelperFunction.isDarkMode(context)
              ? JColors.darkerGrey
              : JColors.light,
          widget: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.contain,
            progressIndicatorBuilder: (context, url, progress) =>
                const JShimmerEffect(width: 100, height: 100),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )));
}
