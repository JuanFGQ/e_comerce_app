import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_comerce_app/common/widgets/icon/circular_icon.dart';
import 'package:e_comerce_app/common/widgets/rounded_images/rounded_images.dart';
import 'package:e_comerce_app/common/widgets/text/section_header.dart';
import 'package:e_comerce_app/features/authentication/screens/shop/screens/prouct_details/widgets/bottom_add_to_cart.dart';
import 'package:e_comerce_app/features/authentication/screens/shop/screens/prouct_details/widgets/product_detail_image_slider.dart';
import 'package:e_comerce_app/features/authentication/screens/shop/screens/prouct_details/widgets/product_meta_data.dart';
import 'package:e_comerce_app/features/authentication/screens/shop/screens/prouct_details/widgets/products_attributes.dart';
import 'package:e_comerce_app/features/authentication/screens/shop/screens/prouct_details/widgets/rating_share_widget.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(children: [
          // PRODUCT IMAGE SLIDER
          TProductImageSlider(),

          //PRODUCT DETAILS

          Padding(
            padding: EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace),
            child: Column(
              children: [
                //ratin and share button
                TRatingAndShare(),

                //PRICE TITLE STOCK & BRAND
                TProductMetaData(),

                //ATTRIBUTES
                ProductsAttributes(),
                SizedBox(height: TSizes.spaceBtwSection),

                //CHECKPOINT BUTTON
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: Text('Checkout'))),
                SizedBox(height: TSizes.spaceBtwSection),

                //DESCRIPTION

                TSectionHeading(title: 'Description', showActionButton: false),
                SizedBox(height: TSizes.spaceBtwSection),
                ReadMoreText(
                  'Ea ipsum aute aliqua eiusmod aute laborum Lorem quis veniam. Sunt quis esse sint dolore deserunt aute quis sint elit ex mollit. Incididunt in nisi officia nostrud pariatur pariatur aliqua eiusmod sunt ipsum deserunt.',
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
                Divider(),
                SizedBox(height: TSizes.spaceBtwSection),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TSectionHeading(
                        title: 'Reviews(199)',
                        onPressed: () {},
                        showActionButton: false),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Iconsax.arrow_right_3, size: 18))
                  ],
                ),
                SizedBox(height: TSizes.spaceBtwSection),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
