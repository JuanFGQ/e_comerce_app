import 'package:e_comerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_comerce_app/common/widgets/brands/brand_card.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backGroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      widget: Column(
        children: [
          //BRAND with product count
          const TBrandCard(showBorder: false),
          const SizedBox(height: TSizes.spaceBtwItems),

          // TBrand TOP 3 PRODUCT IMAGES
          Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList())
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
      child: CRoundedContainer(
          height: 100,
          padding: const EdgeInsets.all(TSizes.md),
          margin: const EdgeInsets.only(right: TSizes.sm),
          backGroundColor: THelperFunction.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
          widget: Image(fit: BoxFit.contain, image: AssetImage(image))));
}
