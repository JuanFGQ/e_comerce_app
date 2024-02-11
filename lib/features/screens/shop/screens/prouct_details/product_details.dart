import 'package:e_comerce_app/common/widgets/text/section_header.dart';
import 'package:e_comerce_app/features/screens/shop/screens/product_reviews/product_reviews.dart';
import 'package:e_comerce_app/features/screens/shop/screens/prouct_details/widgets/bottom_add_to_cart.dart';
import 'package:e_comerce_app/features/screens/shop/screens/prouct_details/widgets/product_detail_image_slider.dart';
import 'package:e_comerce_app/features/screens/shop/screens/prouct_details/widgets/product_meta_data.dart';
import 'package:e_comerce_app/features/screens/shop/screens/prouct_details/widgets/products_attributes.dart';
import 'package:e_comerce_app/features/screens/shop/screens/prouct_details/widgets/rating_share_widget.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(children: [
          // PRODUCT IMAGE SLIDER
          const TProductImageSlider(),

          //PRODUCT DETAILS

          Padding(
            padding: const EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace),
            child: Column(
              children: [
                //ratin and share button
                const TRatingAndShare(),

                //PRICE TITLE STOCK & BRAND
                const TProductMetaData(),

                //ATTRIBUTES
                const ProductsAttributes(),
                const SizedBox(height: TSizes.spaceBtwSection),

                //CHECKPOINT BUTTON
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Checkout'))),
                const SizedBox(height: TSizes.spaceBtwSection),

                //DESCRIPTION

                const TSectionHeading(
                    title: 'Description', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwSection),
                const ReadMoreText(
                  'Ea ipsum aute aliqua eiusmod aute laborum Lorem quis veniam. Sunt quis esse sint dolore deserunt aute quis sint elit ex mollit. Incididunt in nisi officia nostrud pariatur pariatur aliqua eiusmod sunt ipsum deserunt.',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' Show more',
                  trimExpandedText: ' Less',
                  moreStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  lessStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),

                //REVIEWS
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwSection),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TSectionHeading(
                        title: 'Reviews(199)',
                        onPressed: () {},
                        showActionButton: false),
                    IconButton(
                        onPressed: () =>
                            Get.to(() => const ProductReviewsScreen()),
                        icon: const Icon(Iconsax.arrow_right_3, size: 18))
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwSection),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
