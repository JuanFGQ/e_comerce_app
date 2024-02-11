import 'package:e_comerce_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_comerce_app/features/shop/authentication/screen%20onboarding/widgets/on_boarding_dot_navigation.dart';
import 'package:e_comerce_app/features/shop/authentication/screen%20onboarding/widgets/on_boarding_next_button.dart';
import 'package:e_comerce_app/features/shop/authentication/screen%20onboarding/widgets/on_boarding_page.dart';
import 'package:e_comerce_app/features/shop/authentication/screen%20onboarding/widgets/on_boarding_skip.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          //Horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingImage(
                  image: TImages.onBoardingImage1,
                  subTitle: TTexts.onBoardingSubTitle1,
                  title: TTexts.onBoardingSubTitle1),
              OnBoardingImage(
                  image: TImages.onBoardingImage2,
                  subTitle: TTexts.onBoardingSubTitle2,
                  title: TTexts.onBoardingSubTitle2),
              OnBoardingImage(
                  image: TImages.onBoardingImage3,
                  subTitle: TTexts.onBoardingSubTitle3,
                  title: TTexts.onBoardingSubTitle3),
            ],
          ),

          /// Skip Button

          const SkipButton(),

          //Dot navigation SmoothIndicator

          const OnBoardingDotNavigation(),

          //Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
