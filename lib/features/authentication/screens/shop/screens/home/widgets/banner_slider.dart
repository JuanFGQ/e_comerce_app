import 'package:e_comerce_app/features/authentication/screens/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TPromoSlider(
          banners: [
            TImages.onBoardingImage1,
            TImages.onBoardingImage2,
            TImages.onBoardingImage3
          ],
        ));
  }
}
