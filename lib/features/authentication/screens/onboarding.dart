import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/text_strings.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Horizontal scrollable pages
          PageView(
            children: [
              Column(
                children: [
                  Image(
                      width: THelperFunction.screenWidth() * 0.8,
                      height: THelperFunction.screenHeight() * 0.6,
                      image: AssetImage(TImages.onBoardingImage1)),
                  Text(TTexts.onBoardingTitle1,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center),
                  SizedBox(height: TSizes.spaceBtwItems),
                  Text(TTexts.onBoardingSubTitle1,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
