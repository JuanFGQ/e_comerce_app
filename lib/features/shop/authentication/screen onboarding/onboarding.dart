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
                  image: JImages.onBoardingImage1,
                  subTitle: JTexts.onBoardingSubTitle1,
                  title: JTexts.onBoardingSubTitle1),
              OnBoardingImage(
                  image: JImages.onBoardingImage2,
                  subTitle: JTexts.onBoardingSubTitle2,
                  title: JTexts.onBoardingSubTitle2),
              OnBoardingImage(
                  image: JImages.onBoardingImage3,
                  subTitle: JTexts.onBoardingSubTitle3,
                  title: JTexts.onBoardingSubTitle3),
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
