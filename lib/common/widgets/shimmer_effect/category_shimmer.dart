import 'package:e_comerce_app/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class JCategoryShimmer extends StatelessWidget {
  final int itemCount;

  const JCategoryShimmer({super.key, this.itemCount = 6});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) =>
            const SizedBox(width: JSizes.spaceBtwItems),
        itemCount: itemCount,
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image
              JShimmerEffect(width: 55, height: 55, raidus: 55),
              SizedBox(height: JSizes.spaceBtwItems / 2),

              //Text

              JShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
