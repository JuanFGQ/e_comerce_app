import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_comerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_comerce_app/common/widgets/rounded_images/rounded_images.dart';
import 'package:e_comerce_app/features/shop/controllers/banner_controller.dart';
import 'package:e_comerce_app/features/shop/controllers/home_controller.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 0.8,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index),
            ),
            items: banners.map((e) => TRoundedImage(imageUrl: e)).toList()),
        const SizedBox(height: TSizes.spaceBtwItems),
        Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < banners.length; i++)
                TCircularContainer(
                    margin: const EdgeInsets.only(right: 10),
                    width: 20,
                    height: 4,
                    backGroundColor: controller.carouselCurrentIndex.value == i
                        ? TColors.primary
                        : TColors.grey),
            ],
          ),
        )
      ],
    );
  }
}
