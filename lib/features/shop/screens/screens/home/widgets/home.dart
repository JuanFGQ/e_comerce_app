import 'package:e_comerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_comerce_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_comerce_app/common/widgets/layout/grid_layout.dart';
import 'package:e_comerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_comerce_app/common/widgets/shimmer_effect/vertical_shimmer.dart';
import 'package:e_comerce_app/common/widgets/text/section_header.dart';
import 'package:e_comerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:e_comerce_app/features/shop/screens/screens/all_products/all_products.dart';
import 'package:e_comerce_app/features/shop/screens/screens/home/widgets/home_app_bar.dart';
import 'package:e_comerce_app/features/shop/screens/screens/home/widgets/home_categories.dart';
import 'package:e_comerce_app/features/shop/screens/screens/home/widgets/promo_slider.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //CUSTOM HEADER
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  SizedBox(height: TSizes.sm),

                  /// APPBAR
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSection),

                  //SEARCH BAR
                  TSearchContainer(text: 'SearchInStore'),
                  SizedBox(height: TSizes.spaceBtwSection),

                  //CATEGORIES

                  THomeCategories()
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    //PROMO SLIDER
                    const TPromoSlider(
                        // banners: [
                        //   TImages.onBoardingImage1,
                        //   TImages.onBoardingImage2,
                        //   TImages.onBoardingImage3
                        // ],
                        ),
                    const SizedBox(height: TSizes.spaceBtwSection),
                    //!POPULAR PRODUCTS HEADING
                    TSectionHeading(
                      showActionButton: true,
                      title: 'Popular Products',
                      onPressed: () => Get.to(() => AllProducts(
                            title: 'Popular Products',
                            futureMethod: controller.fetchAllFeaturedProducts(),
                          )),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSection),
                    //POPULAR PRODUCTS
                    Obx(() {
                      if (controller.isLoading.value) {
                        return const TVerticalProductShimmer();
                      }
                      if (controller.featuredProducts.isEmpty) {
                        return Center(
                          child: Text('No Data Found',
                              style: Theme.of(context).textTheme.bodyMedium),
                        );
                      }
                      return GridLayout(
                        itemBuilder: (_, index) => ProductCardVertical(
                            product: controller.featuredProducts[index]),
                        itemCount: controller.featuredProducts.length,
                      );
                    })
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
