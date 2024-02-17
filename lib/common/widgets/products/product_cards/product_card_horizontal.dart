import 'package:e_comerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_comerce_app/common/widgets/favourite_icon/favourite_icon.dart';
import 'package:e_comerce_app/common/widgets/icon/circular_icon.dart';
import 'package:e_comerce_app/common/widgets/rounded_images/rounded_images.dart';
import 'package:e_comerce_app/common/widgets/text/brand_title_text_with_verified_icon.dart';
import 'package:e_comerce_app/common/widgets/text/price_text.dart';
import 'package:e_comerce_app/common/widgets/text/product_title_text.dart';
import 'package:e_comerce_app/features/shop/models/poduct_model.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductHorizontalCard extends StatelessWidget {
  const TProductHorizontalCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.lightGrey),
      child: Row(
        children: [
          //THUMBNAIL
          CRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backGroundColor: dark ? TColors.dark : TColors.light,
            widget: Stack(
              children: [
                // THUMBNAIL IMAGE
                const SizedBox(
                    height: 120,
                    width: 120,
                    child: TRoundedImage(
                        imageUrl: TImages.google, applyImageRadius: true)),

                Positioned(
                  top: 12,
                  left: 5,
                  child: CRoundedContainer(
                    radius: TSizes.sm,
                    backGroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    widget: Text(
                      '25%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.black),
                    ),
                  ),
                ),

                //FAVOURITE ICON BUTTON
                Positioned(
                    top: 0,
                    right: 0,
                    child: TFavouriteIcon(productId: product.id)),
              ],
            ),
          )

          //DETAILS
          ,
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(
                          title: 'Product Description', smailSize: true),
                      SizedBox(height: TSizes.spaceBtwItems / 2),
                      TBrandTitleTextWithVerifiedIcon(title: 'Product Brand'),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(child: TProductPriceText(price: '590')),

                      //Add to cart
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSizes.cardRadiusMd),
                              bottomRight:
                                  Radius.circular(TSizes.productImageRadius)),
                          color: TColors.dark,
                        ),
                        child: const SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(Iconsax.add, color: TColors.white),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
