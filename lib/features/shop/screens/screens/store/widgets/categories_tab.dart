import 'package:e_comerce_app/common/widgets/brands/brand_show_case.dart';
import 'package:e_comerce_app/common/widgets/layout/grid_layout.dart';
import 'package:e_comerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_comerce_app/common/widgets/shimmer_effect/vertical_shimmer.dart';
import 'package:e_comerce_app/common/widgets/text/section_header.dart';
import 'package:e_comerce_app/features/shop/controllers/categories_controller.dart';
import 'package:e_comerce_app/features/shop/models/category_model.dart';
import 'package:e_comerce_app/features/shop/models/poduct_model.dart';
import 'package:e_comerce_app/features/shop/screens/screens/all_products/all_products.dart';
import 'package:e_comerce_app/features/shop/screens/screens/store/widgets/category_brand.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                //BRANDS
                CategoryBrand(category: category),
                SizedBox(height: TSizes.spaceBtwItems),

                //!dummy test
                // const TBrandShowCase(
                //   images: [
                //     TImages.onBoardingImage1,
                //     TImages.onBoardingImage2,
                //     TImages.onBoardingImage3
                //   ],
                // ),

                // const TBrandShowCase(
                //   images: [
                //     TImages.onBoardingImage1,
                //     TImages.onBoardingImage2,
                //     TImages.onBoardingImage3
                //   ],
                // ),
                // const SizedBox(height: TSizes.spaceBtwItems),

                /// PRODUCTS
                FutureBuilder(
                    future:
                        controller.getCategoryProducts(categoryId: category.id),
                    builder: (context, snapshot) {
//Helper funtion to handler loader, no record or error
                      final response =
                          TCloudHelperFunction.checkMultiRecordState(
                              snapshot: snapshot,
                              loader: TVerticalProductShimmer());

                      if (response != null) return response;

                      //Record Found

                      final products = snapshot.data!;

                      return Column(
                        children: [
                          TSectionHeading(
                            title: 'You might like',
                            showActionButton: true,
                            onPressed: () => Get.to((AllProducts(
                              title: category.name,
                              futureMethod: controller.getCategoryProducts(
                                  categoryId: category.id, limit: -1),
                            ))),
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems),
                          GridLayout(
                              itemCount: products.length,
                              itemBuilder: (_, index) => ProductCardVertical(
                                    product: products[index],
                                  )),
                          const SizedBox(height: TSizes.spaceBtwSection),
                        ],
                      );
                    })
              ],
            ),
          ),
        ]);
  }
}
