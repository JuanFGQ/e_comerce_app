import 'package:e_comerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_comerce_app/common/widgets/products/rating/rating_indicator.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(backgroundImage: AssetImage(TImages.facebook)),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Text('MobileX', style: Theme.of(context).textTheme.titleLarge)
                ],
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
            ],
          ),
          SizedBox(width: TSizes.spaceBtwItems),

          //REVIEWS

          Row(
            children: [
              TRatingBarIndicator(rating: 4),
              SizedBox(width: TSizes.spaceBtwItems),
              Text('0.1 Nov, 2023',
                  style: Theme.of(context).textTheme.bodyMedium)
            ],
          ),
          SizedBox(height: TSizes.spaceBtwItems),
          ReadMoreText(
              'Ex quis veniam magna duis excepteur adipisicing nisi culpa laborum. Consequat dolor ullamco deserunt exercitation reprehenderit nulla enim. Nostrud nulla excepteur non veniam. Nostrud excepteur elit sit eiusmod sit. Fugiat ut enim magna do exercitation aliquip.',
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimExpandedText: 'show less',
              trimCollapsedText: 'show more',
              moreStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: TColors.primary),
              lessStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: TColors.primary)),
          SizedBox(height: TSizes.spaceBtwItems),

          ///Company Review
          ///
          CRoundedContainer(
            backGroundColor: dark ? TColors.darkerGrey : TColors.grey,
            widget: Padding(
              padding: EdgeInsets.all(TSizes.md),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("M's Store",
                          style: Theme.of(context).textTheme.titleMedium),
                      Text("02 Nov, 2023",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                      'Ex quis veniam magna duis excepteur adipisicing nisi culpa laborum. Consequat dolor ullamco deserunt exercitation reprehenderit nulla enim. Nostrud nulla excepteur non veniam. Nostrud excepteur elit sit eiusmod sit. Fugiat ut enim magna do exercitation aliquip.',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimExpandedText: 'show less',
                      trimCollapsedText: 'show more',
                      moreStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: TColors.primary),
                      lessStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: TColors.primary)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
