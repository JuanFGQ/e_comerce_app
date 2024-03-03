import 'package:e_comerce_app/common/widgets/layout/grid_layout.dart';
import 'package:e_comerce_app/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class JVerticalProductShimmer extends StatelessWidget {
  const JVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Image
            JShimmerEffect(width: 180, height: 180),
            SizedBox(height: JSizes.spaceBtwItems),

            //TEXT
            JShimmerEffect(width: 160, height: 15),
            SizedBox(height: JSizes.spaceBtwItems / 2),
            JShimmerEffect(width: 110, height: 15),

            //
          ],
        ),
      ),
    );
  }
}
