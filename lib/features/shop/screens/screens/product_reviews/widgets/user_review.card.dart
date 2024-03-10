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
    final dark = JHelperFunction.isDarkMode(context);
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                      backgroundImage: AssetImage(JImages.facebook)),
                  const SizedBox(width: JSizes.spaceBtwItems),
                  Text('MobileX', style: Theme.of(context).textTheme.titleLarge)
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
          const SizedBox(width: JSizes.spaceBtwItems),

          //REVIEWS

          Row(
            children: [
              const JRatingBarIndicator(rating: 4),
              const SizedBox(width: JSizes.spaceBtwItems),
              Text('0.1 Nov, 2023',
                  style: Theme.of(context).textTheme.bodyMedium)
            ],
          ),
          const SizedBox(height: JSizes.spaceBtwItems),
          const ReadMoreText(
              'Ex quis veniam magna duis excepteur adipisicing nisi culpa laborum. Consequat dolor ullamco deserunt exercitation reprehenderit nulla enim. Nostrud nulla excepteur non veniam. Nostrud excepteur elit sit eiusmod sit. Fugiat ut enim magna do exercitation aliquip.',
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimExpandedText: 'show less',
              trimCollapsedText: 'show more',
              moreStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: JColors.primary),
              lessStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: JColors.primary)),
          const SizedBox(height: JSizes.spaceBtwItems),

          ///Company Review
          ///
          JRoundedContainer(
            backGroundColor: dark ? JColors.darkerGrey : JColors.grey,
            widget: Padding(
              padding: const EdgeInsets.all(JSizes.md),
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
                  const SizedBox(height: JSizes.spaceBtwItems),
                  const ReadMoreText(
                      'Ex quis veniam magna duis excepteur adipisicing nisi culpa laborum. Consequat dolor ullamco deserunt exercitation reprehenderit nulla enim. Nostrud nulla excepteur non veniam. Nostrud excepteur elit sit eiusmod sit. Fugiat ut enim magna do exercitation aliquip.',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimExpandedText: 'show less',
                      trimCollapsedText: 'show more',
                      moreStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: JColors.primary),
                      lessStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: JColors.primary)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}