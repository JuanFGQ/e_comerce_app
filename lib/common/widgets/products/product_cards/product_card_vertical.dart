import 'package:e_comerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_comerce_app/common/widgets/favourite_icon/favourite_icon.dart';
import 'package:e_comerce_app/common/widgets/products/cart/widgets/product_cart_item.dart';
import 'package:e_comerce_app/common/widgets/rounded_images/rounded_images.dart';
import 'package:e_comerce_app/common/widgets/text/brand_title_text_with_verified_icon.dart';
import 'package:e_comerce_app/common/widgets/text/price_text.dart';
import 'package:e_comerce_app/common/widgets/text/product_title_text.dart';
import 'package:e_comerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:e_comerce_app/features/shop/models/product_model.dart';
import 'package:e_comerce_app/features/shop/screens/screens/prouct_details/product_details.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/enums.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    //
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculatSalePercetange(product.price, product.salePrice);
    final dark = JHelperFunction.isDarkMode(context);
    //
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            // border: Border.all(),
            // boxShadow: [ShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(JSizes.productImageRadius),
            color: dark ? JColors.darkGrey : JColors.white),
        child: Column(
          children: [
            //*THUMBNAIL,WISHLIST

            JRoundedContainer(
              height: 180,
              width: 180,
              // padding: const EdgeInsets.all(5),
              backGroundColor: dark ? JColors.dark : JColors.grey,
              widget: Stack(
                children: [
                  //thumbnail image
                  Center(
                    child: JRoundedImage(
                        isNetworkImage: true,
                        // padding: EdgeInsets.all(TSizes.cardRadiusLg),
                        // backGroundColor: TColors.grey,
                        border: Border.all(),
                        imageUrl: product.thumbnail,
                        applyImageRadius: true),
                  ),

                  //* SALE TAG
                  if (salePercentage != null)
                    Positioned(
                      top: 12,
                      left: 5,
                      child: JRoundedContainer(
                        radius: JSizes.sm,
                        backGroundColor: JColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: JSizes.sm, vertical: JSizes.xs),
                        widget: Text(
                          '$salePercentage%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: JColors.black),
                        ),
                      ),
                    ),

                  //*FAVOURITE ICON BUTTON
                  Positioned(
                      top: 0,
                      right: 0,
                      child: JFavouriteIcon(
                        productId: product.id,
                      )),
                ],
              ),
            ),

            const SizedBox(height: JSizes.spaceBtwItems / 2),

            ///*DETAILS

            Padding(
              padding: const EdgeInsets.only(left: JSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductTitleText(
                      title: product.title,
                      maxLines: 1,
                      size: JSizes.fontSize,
                    ),
                    const SizedBox(height: JSizes.spaceBtwItems / 2),
                    JBrandTitleTextWithVerifiedIcon(title: product.brand!.name)
                  ],
                ),
              ),
            ),
            const Spacer(),

            //*PRICE ROW

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //*PRICE
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // if (product.productType ==
                      //         ProductType.single.toString() &&
                      //     product.salePrice > 0)
                      if (product.salePrice > 0)
                        //discounted price
                        Padding(
                          padding: const EdgeInsets.only(left: JSizes.md),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),

                      //price, show sale price as main price if sale exist
                      Padding(
                        padding: const EdgeInsets.only(left: JSizes.md),
                        child: JProductPriceText(
                            price: product.salePrice.toString()),
                      )
                      // Padding(
                      //   padding: const EdgeInsets.only(left: TSizes.md),
                      //   child: TProductPriceText(
                      //       price: controller.getProductsPrice(product),
                      //       isLarge: false),
                      // ),
                    ],
                  ),
                ),

                //*ADD TO CART "BUTTON"
                ProductCartAddToCartButton(product: product)
              ],
            )
          ],
        ),
      ),
    );
  }
}
