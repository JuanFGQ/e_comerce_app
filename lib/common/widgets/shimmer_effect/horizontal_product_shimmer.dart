import 'package:e_comerce_app/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class JHorizontalProductShimmer extends StatelessWidget {
  const JHorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: JSizes.spaceBtwSection),
      height: 120,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, __) => const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //image
                  JShimmerEffect(width: 120, height: 120),
                  SizedBox(width: JSizes.spaceBtwItems)

                  //text
                  ,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: JSizes.spaceBtwItems / 2),
                      JShimmerEffect(width: 160, height: 15),
                      SizedBox(height: JSizes.spaceBtwItems / 2),
                      JShimmerEffect(width: 110, height: 15),
                      SizedBox(height: JSizes.spaceBtwItems / 2),
                      JShimmerEffect(width: 80, height: 15),
                      Spacer()
                    ],
                  )
                ],
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: JSizes.spaceBtwItems,
              ),
          itemCount: itemCount),
    );
  }
}
