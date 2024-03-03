import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_comerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_comerce_app/common/widgets/rounded_images/rounded_images.dart';
import 'package:e_comerce_app/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:e_comerce_app/features/shop/controllers/banner_controller.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JPromoSlider extends StatelessWidget {
  const JPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Obx(
      () {
        //loader

//43
        if (controller.isLoading.value) {
          return const JShimmerEffect(width: double.infinity, height: 190);
        }

        //no data found
        if (controller.banners.isEmpty) {
          return const Center(child: Text('No Data Found!'));
        } else {
          return Column(
            children: [
              CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 0.9,
                    onPageChanged: (index, _) =>
                        controller.updatePageIndicator(index),
                  ),
                  items: controller.banners
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: JRoundedImage(
                              fit: BoxFit.cover,
                              imageUrl: e.imageUrl,
                              isNetworkImage: true,
                              onPressed: () => Get.toNamed(e.targetScreen),
                            ),
                          ))
                      .toList()),
              const SizedBox(height: JSizes.spaceBtwItems),
              Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      JCircularContainer(
                          margin: const EdgeInsets.only(right: 10),
                          width: 20,
                          height: 4,
                          backGroundColor:
                              controller.carouselCurrentIndex.value == i
                                  ? JColors.primary
                                  : JColors.grey),
                  ],
                ),
              )
            ],
          );
        }
      },
    );
  }
}
