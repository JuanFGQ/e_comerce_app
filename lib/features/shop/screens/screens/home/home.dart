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
import 'package:e_comerce_app/features/shop/screens/screens/new_product/new_product.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const NewProductScreen()),
        child: const Icon(Iconsax.add, color: JColors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //CUSTOM HEADER
            const JPrimaryHeaderContainer(
              child: Column(
                children: [
                  SizedBox(height: JSizes.sm),

                  /// APPBAR
                  JHomeAppBar(),
                  SizedBox(height: JSizes.spaceBtwSection),

                  //SEARCH BAR
                  // JSearchContainer(text: 'SearchInStore'),
                  // SizedBox(height: JSizes.spaceBtwSection),

                  //CATEGORIES

                  JHomeCategories()
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(JSizes.defaultSpace),
                child: Column(
                  children: [
                    //PROMO SLIDER
                    // const JPromoSlider(),
                    // const SizedBox(height: JSizes.spaceBtwSection),
                    //!POPULAR PRODUCTS HEADING
                    JSectionHeading(
                      showActionButton: true,
                      title: 'Popular Products',
                      onPressed: () => Get.to(() => AllProducts(
                            title: 'Popular Products',
                            futureMethod: controller.fetchAllFeaturedProducts(),
                          )),
                    ),
                    const SizedBox(height: JSizes.spaceBtwSection),
                    //!popular products
                    Obx(() {
                      if (controller.isLoading.value) {
                        return const JVerticalProductShimmer();
                      }
                      if (controller.featuredProducts.isEmpty) {
                        return Center(
                          child: Text('No Data Found',
                              style: Theme.of(context).textTheme.bodyMedium),
                        );
                      }

                      // data founded
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
