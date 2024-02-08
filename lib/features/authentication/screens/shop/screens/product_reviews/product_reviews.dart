import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/features/authentication/screens/shop/screens/product_reviews/widgets/overall_rating_indicator.dart';
import 'package:e_comerce_app/features/authentication/screens/shop/screens/product_reviews/widgets/ratings_indicator.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: TAppBar(title: Text('Reviews & Ratings')),

      //body
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Ratings and reviews are verified and are from pleople who use the same type of device that you use'),
            SizedBox(height: TSizes.defaultSpace),

            //overall product ratings
            OverallProductRatings(),
            TRatingBarIndicator()
          ],
        ),
      )),
    );
  }
}

class TRatingBarIndicator extends StatelessWidget {
  const TRatingBarIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: 3.5,
        itemSize: 20,
        itemCount: 4,
        unratedColor: TColors.grey,
        itemBuilder: (_, __) => const Icon(
              Iconsax.star,
              color: TColors.primary,
            ));
  }
}
