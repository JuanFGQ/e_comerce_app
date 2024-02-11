import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class TRatingBarIndicator extends StatelessWidget {
  const TRatingBarIndicator({
    super.key,
    required this.rating,
  });

  final double rating;

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