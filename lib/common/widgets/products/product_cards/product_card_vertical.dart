import 'package:e_comerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_comerce_app/common/widgets/icon/circular_icon.dart';
import 'package:e_comerce_app/common/widgets/rounded_images/rounded_images.dart';
import 'package:e_comerce_app/common/widgets/text/brand_title_text_with_verified_icon.dart';
import 'package:e_comerce_app/common/widgets/text/price_text.dart';
import 'package:e_comerce_app/common/widgets/text/product_title_text.dart';
import 'package:e_comerce_app/features/authentication/screens/shop/screens/prouct_details/product_details.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            // border: Border.all(),
            // boxShadow: [ShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? TColors.darkGrey : TColors.white),
        child: Column(
          children: [
            //THUMBNAIL,WISHLIST

            CRoundedContainer(
              height: 180,
              // padding: const EdgeInsets.all(5),
              backGroundColor: dark ? TColors.dark : TColors.grey,
              widget: Stack(
                children: [
                  //thumbnail image
                  TRoundedImage(
                      // padding: EdgeInsets.all(TSizes.cardRadiusLg),
                      // backGroundColor: TColors.grey,
                      border: Border.all(),
                      imageUrl: TImages.onBoardingImage2,
                      applyImageRadius: true),

                  // SALE TAG

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
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: TCircularIcon(
                          backGroundColor: TColors.lightGrey,
                          margin: EdgeInsets.all(5),
                          icon: Iconsax.heart5,
                          color: Colors.red)),
                ],
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems / 2),

            ///DETAILS

            const Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(title: 'Produc Text', smailSize: true),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  TBrandTitleTextWithVerifiedIcon(title: 'Nike')
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //PRICE
                const Padding(
                  padding: EdgeInsets.only(left: TSizes.md),
                  child: TProductPriceText(price: '35', isLarge: false),
                ),

                //ADD TO CART "BUTTON"
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
                      child: Icon(
                        Iconsax.add,
                        color: TColors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
