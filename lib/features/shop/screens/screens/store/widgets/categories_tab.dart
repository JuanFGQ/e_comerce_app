import 'package:e_comerce_app/common/widgets/brands/brand_show_case.dart';
import 'package:e_comerce_app/common/widgets/layout/grid_layout.dart';
import 'package:e_comerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_comerce_app/common/widgets/text/section_header.dart';
import 'package:e_comerce_app/features/shop/models/category_model.dart';
import 'package:e_comerce_app/features/shop/models/poduct_model.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                //BRANDS

                const TBrandShowCase(
                  images: [
                    TImages.onBoardingImage1,
                    TImages.onBoardingImage2,
                    TImages.onBoardingImage3
                  ],
                ),

                const TBrandShowCase(
                  images: [
                    TImages.onBoardingImage1,
                    TImages.onBoardingImage2,
                    TImages.onBoardingImage3
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                /// PRODUCTS
                TSectionHeading(
                  title: 'You might like',
                  showActionButton: true,
                  onPressed: () {},
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                GridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => ProductCardVertical(
                          product: ProductModel.empty(),
                        )),
                const SizedBox(height: TSizes.spaceBtwSection),
              ],
            ),
          ),
        ]);
  }
}
