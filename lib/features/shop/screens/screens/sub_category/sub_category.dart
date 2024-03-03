import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:e_comerce_app/common/widgets/rounded_images/rounded_images.dart';
import 'package:e_comerce_app/common/widgets/shimmer_effect/horizontal_product_shimmer.dart';
import 'package:e_comerce_app/common/widgets/text/section_header.dart';
import 'package:e_comerce_app/features/shop/controllers/categories_controller.dart';
import 'package:e_comerce_app/features/shop/models/category_model.dart';
import 'package:e_comerce_app/features/shop/screens/screens/all_products/all_products.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: JAppBar(title: Text(category.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(JSizes.defaultSpace),
          child: Column(
            children: [
              //BANNER
              const JRoundedImage(
                  imageUrl: JImages.onBoardingImage1,
                  width: double.infinity,
                  height: null,
                  applyImageRadius: true),
              const SizedBox(height: JSizes.spaceBtwSection),

              //SUB CATEFORY

              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    //handle loader no record or error message
                    const loader = JHorizontalProductShimmer();
                    final widget = JCloudHelperFunction.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    //record found
                    final products = snapshot.data!;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: products.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final subCategory = products[index];
                        return FutureBuilder(
                            future: controller.getCategoryProducts(
                                categoryId: subCategory.id),
                            builder: (context, snapshot) {
                              //handle loader , no record or error message
                              const loader = JHorizontalProductShimmer();
                              final widget =
                                  JCloudHelperFunction.checkMultiRecordState(
                                      snapshot: snapshot, loader: loader);
                              if (widget != null) return widget;

                              //RECORD FOUND
                              final subCategories = snapshot.data!;

                              return Column(
                                children: [
                                  //heading
                                  JSectionHeading(
                                      title: subCategory.name,
                                      onPressed: () => Get.to(() => AllProducts(
                                            title: subCategory.name,
                                            futureMethod:
                                                controller.getCategoryProducts(
                                                    categoryId: subCategory.id,
                                                    limit: -1),
                                          )),
                                      showActionButton: true),
                                  const SizedBox(
                                      height: JSizes.spaceBtwItems / 2),

                                  //list of products
                                  SizedBox(
                                    height: 120,
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                              width: JSizes.spaceBtwItems),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: subCategories.length,
                                      itemBuilder: (context, index) {
                                        return JProductHorizontalCard(
                                          product: subCategories[index],
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: JSizes.spaceBtwSection)
                                ],
                              );
                            });
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
