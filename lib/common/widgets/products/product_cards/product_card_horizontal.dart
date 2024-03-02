import 'package:e_comerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_comerce_app/common/widgets/favourite_icon/favourite_icon.dart';
import 'package:e_comerce_app/common/widgets/rounded_images/rounded_images.dart';
import 'package:e_comerce_app/common/widgets/text/brand_title_text_with_verified_icon.dart';
import 'package:e_comerce_app/common/widgets/text/price_text.dart';
import 'package:e_comerce_app/common/widgets/text/product_title_text.dart';
import 'package:e_comerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:e_comerce_app/features/shop/models/product_model.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/enums.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductHorizontalCard extends StatelessWidget {
  const TProductHorizontalCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculatSalePercetange(product.price, product.salePrice);
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
                SizedBox(
                    height: 120,
                    width: 120,
                    child: TRoundedImage(
                        isNetworkImage: true,
                        imageUrl: product.thumbnail,
                        applyImageRadius: true)),

//SALE TAG
                if (salePercentage != null)
                  Positioned(
                    top: 12,
                    left: 5,
                    child: CRoundedContainer(
                      radius: TSizes.sm,
                      backGroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      widget: Text(
                        '$salePercentage%',
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(title: product.title, smallSize: true),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      TBrandTitleTextWithVerifiedIcon(
                          title: product.brand!.name),
                    ],
                  ),
                  const Spacer(),

                  //SALE PRICE

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //*PRICE
                      Flexible(
                        child: Column(
                          children: [
                            if (product.productType ==
                                    ProductType.single.toString() &&
                                product.salePrice > 0)
                              Padding(
                                padding: const EdgeInsets.only(left: TSizes.md),
                                child: Text(
                                  product.price.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .apply(
                                          decoration:
                                              TextDecoration.lineThrough),
                                ),
                              ),
                            //
                            //price, show sale price as main price if sale exist
                            //

                            Padding(
                              padding: const EdgeInsets.only(left: TSizes.md),
                              child: TProductPriceText(
                                  price: controller.getProductsPrice(product),
                                  isLarge: false),
                            ),
                          ],
                        ),
                      ),

                      //*ADD TO CART "BUTTON"
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
          )
        ],
      ),
    );
  }
}
