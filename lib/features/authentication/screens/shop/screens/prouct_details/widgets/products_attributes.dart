import 'package:e_comerce_app/common/widgets/chips/choice_chip.dart';
import 'package:e_comerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_comerce_app/common/widgets/text/price_text.dart';
import 'package:e_comerce_app/common/widgets/text/product_title_text.dart';
import 'package:e_comerce_app/common/widgets/text/section_header.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class ProductsAttributes extends StatelessWidget {
  const ProductsAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      children: [
        CRoundedContainer(
          padding: EdgeInsets.all(TSizes.md),
          backGroundColor: dark ? TColors.darkerGrey : TColors.grey,
          widget: Column(
            children: [
              ///TITLE PRICE AND STOCK STATUS
              Row(
                children: [
                  const TSectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(
                              title: 'Price: ', smailSize: true),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          //Actual price
                          Text('\$25',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(
                                      decoration: TextDecoration.lineThrough)),
                          const SizedBox(width: TSizes.spaceBtwItems),

                          //sale price
                          TProductPriceText(price: '20')
                        ],
                      ),
                      Row(
                        children: [
                          ProductTitleText(title: 'Stock:  ', smailSize: true),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              //VARIATION DESCRIPTION
              ProductTitleText(
                  title: 'This is a brief description of each product',
                  smailSize: true,
                  maxLines: 4)
            ],
          ),
        ),
        SizedBox(height: TSizes.spaceBtwItems),

        //Atributes - Colors
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(title: 'Colors', showActionButton: false),
            SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'Red', selected: true, onSelected: (p0) {}),
                TChoiceChip(text: 'Pink', selected: false, onSelected: (p0) {}),
                TChoiceChip(text: 'Blue', selected: false, onSelected: (p0) {}),
              ],
            ),
          ],
        ),
        //Atributes - Sizes

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(title: 'Size', showActionButton: false),
            SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'EU 34', selected: true, onSelected: (p0) {}),
                TChoiceChip(
                    text: 'EU 36', selected: false, onSelected: (p0) {}),
                TChoiceChip(
                    text: 'EU 38', selected: false, onSelected: (p0) {}),
              ],
            ),
          ],
        )
      ],
    );
  }
}
