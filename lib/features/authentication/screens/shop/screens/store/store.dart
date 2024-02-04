import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_comerce_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_comerce_app/common/widgets/images/circular_images.dart';
import 'package:e_comerce_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:e_comerce_app/common/widgets/text/section_header.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCartCounterIcon(
            onPressed: () {},
          )
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: THelperFunction.isDarkMode(context)
                  ? TColors.dark
                  : TColors.light,
              expandedHeight: 440,
              flexibleSpace: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    //SEARCH BAR
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const TSearchContainer(
                        text: 'Search in store',
                        showBorder: true,
                        showBakcground: false),
                    const SizedBox(height: TSizes.spaceBtwSection),

                    ///FEATURE BRANDS
                    TSectionHeading(title: 'Featured Brands', onPressed: () {}),
                    const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                    CRoundedContainer(
                      padding: EdgeInsets.all(TSizes.sm),
                      showBorder: true,
                      backGroundColor: Colors.transparent,
                      widget: Row(
                        children: [
                          //ICON

                          TCircularImage(
                              image: TImages.google,
                              backGroundColor: Colors.transparent,
                              isNetWorkImage: false,
                              overlayColor: THelperFunction.isDarkMode(context)
                                  ? TColors.white
                                  : TColors.black),
                          const SizedBox(height: TSizes.spaceBtwItems / 2),
                          //TEXT
                          Column(
                            children: [
                              Text('HOLA'),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ];
        },
        body: Container(),
      ),
    );
  }
}
