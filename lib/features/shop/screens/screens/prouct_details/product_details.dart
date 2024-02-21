import 'package:e_comerce_app/common/widgets/text/section_header.dart';
import 'package:e_comerce_app/features/shop/models/poduct_model.dart';
import 'package:e_comerce_app/features/shop/screens/screens/product_reviews/product_reviews.dart';
import 'package:e_comerce_app/features/shop/screens/screens/prouct_details/widgets/bottom_add_to_cart.dart';
import 'package:e_comerce_app/features/shop/screens/screens/prouct_details/widgets/product_detail_image_slider.dart';
import 'package:e_comerce_app/features/shop/screens/screens/prouct_details/widgets/product_meta_data.dart';
import 'package:e_comerce_app/features/shop/screens/screens/prouct_details/widgets/products_attributes.dart';
import 'package:e_comerce_app/features/shop/screens/screens/prouct_details/widgets/rating_share_widget.dart';
import 'package:e_comerce_app/utils/constants/enums.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(children: [
          // PRODUCT IMAGE SLIDER
          TProductImageSlider(product: product),

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
                TProductMetaData(product: product),

                //ATTRIBUTES
                if (product.productType == ProductType.variable.toString())
                  ProductsAttributes(product: product),
                if (product.productType == ProductType.variable.toString())
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
                ReadMoreText(
                  product.description ?? '',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' Show more',
                  trimExpandedText: ' Less',
                  moreStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w800),
                  lessStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w800),
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
