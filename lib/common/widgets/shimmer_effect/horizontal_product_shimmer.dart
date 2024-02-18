import 'package:e_comerce_app/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class THorizontalProductShimmer extends StatelessWidget {
  const THorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwSection),
      height: 120,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, __) => const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //image
                  TShimmerEffect(width: 120, height: 120),
                  SizedBox(width: TSizes.spaceBtwItems)

                  //text
                  ,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: TSizes.spaceBtwItems / 2),
                      TShimmerEffect(width: 160, height: 15),
                      SizedBox(height: TSizes.spaceBtwItems / 2),
                      TShimmerEffect(width: 110, height: 15),
                      SizedBox(height: TSizes.spaceBtwItems / 2),
                      TShimmerEffect(width: 80, height: 15),
                      Spacer()
                    ],
                  )
                ],
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
          itemCount: itemCount),
    );
  }
}
