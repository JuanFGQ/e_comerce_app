import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/common/widgets/appbar/tab_bar.dart';
import 'package:e_comerce_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_comerce_app/common/widgets/layout/grid_layout.dart';
import 'package:e_comerce_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:e_comerce_app/common/widgets/shimmer_effect/brand_shimmer.dart';
import 'package:e_comerce_app/common/widgets/text/section_header.dart';
import 'package:e_comerce_app/common/widgets/brands/brand_card.dart';
import 'package:e_comerce_app/features/shop/controllers/product/brand_controller.dart';
import 'package:e_comerce_app/features/shop/screens/brands/all_brands.dart';
import 'package:e_comerce_app/features/shop/controllers/categories_controller.dart';
import 'package:e_comerce_app/features/shop/screens/brands/brand_products.dart';
import 'package:e_comerce_app/features/shop/screens/screens/store/widgets/categories_tab.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      //change this to a specific number to
      length: categories.length,
      child: Scaffold(
        appBar: JAppBar(
          showBackArrow: true,
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: const [JCartCounterIcon()],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxScrolled) {
            return [
              SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: JHelperFunction.isDarkMode(context)
                      ? JColors.dark
                      : JColors.light,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(JSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        //SEARCH BAR
                        const SizedBox(height: JSizes.spaceBtwItems),
                        const JSearchContainer(
                            text: 'Search in store',
                            showBorder: true,
                            showBakcground: false),
                        const SizedBox(height: JSizes.spaceBtwSection),

                        ///FEATURE BRANDS
                        JSectionHeading(
                            showActionButton: true,
                            title: 'Featured Brands',
                            onPressed: () =>
                                Get.to(() => const AllBrandsScreen())),
                        const SizedBox(height: JSizes.spaceBtwItems / 1.5),

                        Obx(() {
                          if (brandController.isLoading.value) {
                            return const JBrandShimmer();
                          }

                          if (brandController.featuredBrands.isEmpty) {
                            return Center(
                              child: Text(
                                'No Data Found!',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(color: Colors.white),
                              ),
                            );
                          }
                          return GridLayout(
                              itemCount: brandController.featuredBrands.length,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                final brand =
                                    brandController.featuredBrands[index];
                                return JBrandCard(
                                  showBorder: false,
                                  brand: brand,
                                  onTap: () => Get.to(
                                      () => BrandProductsScreen(brand: brand)),
                                );
                              });
                        })
                      ],
                    ),
                  ),

                  ///TABS BAR

                  bottom: JTabBar(
                      tabs: categories
                          .map((category) => Tab(child: Text(category.name)))
                          .toList()

                      //  [
                      //   Tab(child: Text('Sports')),
                      //   Tab(child: Text('Furniture')),
                      //   Tab(child: Text('Electronics')),
                      //   Tab(child: Text('Clothes')),
                      //   Tab(child: Text('Cosmetics')),
                      // ]
                      ))
            ];
          },

          //BODY TAB BAR VIEW
          body: TabBarView(
              children: categories
                  .map((element) => JCategoryTab(category: element))
                  .toList()
              // [
              //   TCategoryTab(),
              //   TCategoryTab(),
              //   TCategoryTab(),
              //   TCategoryTab(),
              //   TCategoryTab(),
              // ],
              ),
        ),
      ),
    );
  }
}
