import 'package:e_comerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_comerce_app/common/widgets/images/circular_images.dart';
import 'package:e_comerce_app/common/widgets/text/brand_title_text_with_verified_icon.dart';
import 'package:e_comerce_app/common/widgets/text/price_text.dart';
import 'package:e_comerce_app/common/widgets/text/product_title_text.dart';
import 'package:e_comerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:e_comerce_app/features/shop/models/poduct_model.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/enums.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculatSalePercetange(product.price, product.salePrice);

    final darkMode = THelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //price & sale price

        Row(
          children: [
            //sale tag
            CRoundedContainer(
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
            const SizedBox(width: TSizes.spaceBtwItems),

            //!price
            if (product.productType == ProductType.variable.toString() &&
                product.salePrice > 0)
              Text('\$${product.price}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(decoration: TextDecoration.lineThrough)),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(width: TSizes.spaceBtwItems),

            TProductPriceText(
                price: product.price.toString(),

                // controller.getProductsPrice(product),
                isLarge: true)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        //title
        ProductTitleText(
          title: product.title,
        ),
        const SizedBox(height: TSizes.spaceBtwSection / 2),

        //stock status

        Row(
          children: [
            ProductTitleText(
              title: 'Status :',
              size: TSizes.fontSizeMd,
            ),
            SizedBox(width: TSizes.spaceBtwItems / 2),
            Text(controller.getProductStockStatus(product.stock),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        //brand
        Row(
          children: [
            TCircularImage(
              fit: BoxFit.cover,
              isNetWorkImage: false,
              width: 70,
              height: 70,
              image: product.brand != null ? product.brand!.image : '',
            ),
            TBrandTitleTextWithVerifiedIcon(
                title: product.brand != null ? product.brand!.name : '',
                brandTextSize: TextSizes.medium),
          ],
        )
      ],
    );
  }
}
