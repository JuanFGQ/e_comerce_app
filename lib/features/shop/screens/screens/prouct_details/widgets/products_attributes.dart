import 'package:e_comerce_app/common/widgets/chips/choice_chip.dart';
import 'package:e_comerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_comerce_app/common/widgets/text/price_text.dart';
import 'package:e_comerce_app/common/widgets/text/product_title_text.dart';
import 'package:e_comerce_app/common/widgets/text/section_header.dart';
import 'package:e_comerce_app/features/shop/controllers/product/variation_controller.dart';
import 'package:e_comerce_app/features/shop/models/product_model.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsAttributes extends StatelessWidget {
  const ProductsAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunction.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
      () => Column(
        children: [
          if (controller.selectedVariation.value.id.isNotEmpty)
            JRoundedContainer(
              padding: const EdgeInsets.all(JSizes.md),
              backGroundColor: dark ? JColors.darkerGrey : JColors.grey,
              widget: Column(
                children: [
                  ///TITLE PRICE AND STOCK STATUS
                  Row(
                    children: [
                      const JSectionHeading(
                        title: 'Variation',
                        showActionButton: false,
                      ),
                      const SizedBox(width: JSizes.spaceBtwItems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const ProductTitleText(
                                  title: 'Price: ', smallSize: true),
                              const SizedBox(width: JSizes.spaceBtwItems),
                              //Actual price
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text('\$${controller.getVariationPrice()}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough)),
                              const SizedBox(width: JSizes.spaceBtwItems),

                              //sale price
                              JProductPriceText(
                                  price: controller.getVariationPrice())
                            ],
                          ),
                          Row(
                            children: [
                              const ProductTitleText(
                                  title: 'Stock:  ', smallSize: true),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  //VARIATION DESCRIPTION
                  const ProductTitleText(
                      title: 'This is a brief description of each product',
                      smallSize: true,
                      maxLines: 4)
                ],
              ),
            ),
          const SizedBox(height: JSizes.spaceBtwItems),

          //Atributes - Colors
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: product.productAttributes!
                  .map(
                    (attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        JSectionHeading(
                            title: attribute.name ?? '',
                            showActionButton: false),
                        const SizedBox(height: JSizes.spaceBtwItems / 2),
                        Obx(
                          () => Wrap(
                              spacing: 8,
                              children: attribute.values!.map((attributeValue) {
                                final isSelected = controller
                                        .selectedAttributes[attribute.name] ==
                                    attributeValue;
                                final available = controller
                                    .getAttributesAvailabilityVariation(
                                        product.productVariations!,
                                        attribute.name!)
                                    .contains(attributeValue);

                                return JChoiceChip(
                                    text: attributeValue,
                                    selected: isSelected,
                                    onSelected: available
                                        ? (selected) {
                                            if (selected && available) {
                                              controller.onAttributeSelected(
                                                  product,
                                                  attribute.name ?? '',
                                                  attributeValue);
                                            }
                                          }
                                        : null);
                              }).toList()
                              // .map((e) => TChoiceChip(
                              //       text: e,
                              //       selected: false,
                              //       onSelected: (value) {},
                              //     ))
                              // .toList()
                              //  [

                              //   TChoiceChip(
                              //       text: 'Red', selected: true, onSelected: (p0) {}),
                              //   TChoiceChip(
                              //       text: 'Pink',
                              //       selected: false,
                              //       onSelected: (p0) {}),
                              //   TChoiceChip(
                              //       text: 'Blue',
                              //       selected: false,
                              //       onSelected: (p0) {}),
                              // ],
                              ),
                        ),
                      ],
                    ),
                  )
                  .toList()),

          //Atributes - Sizes

          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     const TSectionHeading(title: 'Size', showActionButton: false),
          //     const SizedBox(height: TSizes.spaceBtwItems / 2),
          //     Wrap(
          //       spacing: 8,
          //       children: [
          //         TChoiceChip(text: 'EU 34', selected: true, onSelected: (p0) {}),
          //         TChoiceChip(
          //             text: 'EU 36', selected: false, onSelected: (p0) {}),
          //         TChoiceChip(
          //             text: 'EU 38', selected: false, onSelected: (p0) {}),
          //       ],
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
