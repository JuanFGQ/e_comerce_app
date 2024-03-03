import 'package:e_comerce_app/common/widgets/text/section_header.dart';
import 'package:e_comerce_app/features/shop/models/product_model.dart';
import 'package:e_comerce_app/features/shop/screens/screens/checkout/checkout.dart';
import 'package:e_comerce_app/features/shop/screens/screens/product_reviews/product_reviews.dart';
import 'package:e_comerce_app/features/shop/screens/screens/prouct_details/widgets/bottom_add_to_cart.dart';
import 'package:e_comerce_app/features/shop/screens/screens/prouct_details/widgets/product_detail_image_slider.dart';
import 'package:e_comerce_app/features/shop/screens/screens/prouct_details/widgets/product_meta_data.dart';
import 'package:e_comerce_app/features/shop/screens/screens/prouct_details/widgets/products_attributes.dart';
import 'package:e_comerce_app/features/shop/screens/screens/prouct_details/widgets/rating_share_widget.dart';
import 'package:e_comerce_app/utils/constants/enums.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
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
      bottomNavigationBar: JBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(children: [
          //! PRODUCT IMAGE SLIDER
          JProductImageSlider(product: product),

          //PRODUCT DETAILS

          Padding(
            padding: const EdgeInsets.only(
                right: JSizes.defaultSpace,
                left: JSizes.defaultSpace,
                bottom: JSizes.defaultSpace),
            child: Column(
              children: [
                //ratin and share button
                const JRatingAndShare(),

                //PRICE TITLE STOCK & BRAND
                JProductMetaData(product: product),

                //ATTRIBUTES
                if (product.productType == ProductType.variable.toString())
                  ProductsAttributes(product: product),
                if (product.productType == ProductType.variable.toString())
                  const SizedBox(height: JSizes.spaceBtwSection),

                //!CHECKOUT BUTTON
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => Get.to(() => const CheckOutScreen()),
                        child: const Text('Checkout'))),
                const SizedBox(height: JSizes.spaceBtwSection),

                //!DESCRIPTION

                const JSectionHeading(
                    title: 'Description', showActionButton: false),
                const SizedBox(height: JSizes.spaceBtwSection),
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

                //!REVIEWS
                const Divider(),
                const SizedBox(height: JSizes.spaceBtwSection),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    JSectionHeading(
                        title: 'Reviews(199)',
                        onPressed: () {},
                        showActionButton: false),
                    IconButton(
                        onPressed: () =>
                            Get.to(() => const ProductReviewsScreen()),
                        icon: const Icon(Iconsax.arrow_right_3, size: 18))
                  ],
                ),
                const SizedBox(height: JSizes.spaceBtwSection),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
