import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/common/widgets/products/rating/rating_indicator.dart';
import 'package:e_comerce_app/features/screens/shop/screens/product_reviews/widgets/overall_rating_indicator.dart';
import 'package:e_comerce_app/features/screens/shop/screens/product_reviews/widgets/user_review.card.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: const TAppBar(title: Text('Reviews & Ratings')),

      //body
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                'Ratings and reviews are verified and are from pleople who use the same type of device that you use'),
            const SizedBox(height: TSizes.defaultSpace),

            //overall product ratings
            const OverallProductRatings(),
            const TRatingBarIndicator(rating: 3.5),
            Text('12,611', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: TSizes.spaceBtwSection),

            ///USER Reviews List
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
          ],
        ),
      )),
    );
  }
}
