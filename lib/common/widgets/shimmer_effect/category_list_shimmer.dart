import 'package:e_comerce_app/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class JListTileShimmer extends StatelessWidget {
  const JListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            JShimmerEffect(width: 50, height: 50, raidus: 50),
            SizedBox(width: JSizes.spaceBtwItems),
            Column(
              children: [
                JShimmerEffect(width: 100, height: 15),
                SizedBox(height: JSizes.spaceBtwItems / 2),
                JShimmerEffect(width: 80, height: 12)
              ],
            )
          ],
        )
      ],
    );
  }
}
