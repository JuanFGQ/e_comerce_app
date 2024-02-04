import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_comerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_comerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_comerce_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_comerce_app/common/widgets/image_text_widgets/scrollable_categories.dart';
import 'package:e_comerce_app/common/widgets/layout/grid_layout.dart';
import 'package:e_comerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_comerce_app/common/widgets/rounded_images/rounded_images.dart';
import 'package:e_comerce_app/common/widgets/text/section_header.dart';
import 'package:e_comerce_app/features/authentication/screens/shop/screens/home/widgets/home_app_bar.dart';
import 'package:e_comerce_app/features/authentication/screens/shop/screens/home/widgets/home_categories.dart';
import 'package:e_comerce_app/features/authentication/screens/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/device/devices.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //CUSTOM HEADER
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  const SizedBox(height: TSizes.sm),

                  /// APPBAR
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSection),

                  //SEARCH BAR
                  const TSearchContainer(text: 'SearchInStore'),
                  const SizedBox(height: TSizes.spaceBtwSection),

                  //CATEGORIES

                  const ScrollableCategories()
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    //PROMO SLIDER
                    const TPromoSlider(
                      banners: [
                        TImages.onBoardingImage1,
                        TImages.onBoardingImage2,
                        TImages.onBoardingImage3
                      ],
                    ),
                    SizedBox(height: TSizes.spaceBtwSection),
                    //POPULAR PRODUCTS HEADING
                    TSectionHeading(title: 'Popular Products'),
                    SizedBox(height: TSizes.spaceBtwSection),
                    //POPULAR PRODUCTS
                    GridLayout(
                      itemBuilder: (p0, p1) => const ProductCardVertical(),
                      itemCount: 4,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
