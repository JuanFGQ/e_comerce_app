import 'package:e_comerce_app/features/shop/screens/screens/product_reviews/widgets/ratings_indicator.dart';
import 'package:flutter/material.dart';

class OverallProductRatings extends StatelessWidget {
  const OverallProductRatings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child:
                Text('4.8', style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              JRatingProgressIndicator(text: '5', value: 1.0),
              JRatingProgressIndicator(text: '4', value: 0.8),
              JRatingProgressIndicator(text: '3', value: 0.6),
              JRatingProgressIndicator(text: '2', value: 0.4),
              JRatingProgressIndicator(text: '1', value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}
