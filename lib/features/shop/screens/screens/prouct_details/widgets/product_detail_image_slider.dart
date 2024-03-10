import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_comerce_app/common/widgets/favourite_icon/favourite_icon.dart';
import 'package:e_comerce_app/common/widgets/rounded_images/rounded_images.dart';
import 'package:e_comerce_app/features/shop/controllers/product/images_controller.dart';
import 'package:e_comerce_app/features/shop/models/product_model.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JProductImageSlider extends StatelessWidget {
  const JProductImageSlider({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunction.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return JCurvedEdgesWidget(
      child: Container(
        color: dark ? JColors.darkGrey : JColors.light,
        child: Stack(
          children: [
            //MAIN LARGE PRODUCT IMAGE
            SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(JSizes.productImageRadius * 2),
                  child: Center(child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downLoadProgress) =>
                            CircularProgressIndicator(
                                value: downLoadProgress.progress,
                                color: JColors.primary),
                      ),
                    );
                  })),
                )),

            //IMAGE SLIDER
            Positioned(
              right: 0,
              bottom: 30,
              left: JSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: images.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(width: JSizes.spaceBtwItems),
                    itemBuilder: (_, index) => Obx(
                          () {
                            final imageSelected =
                                controller.selectedProductImage.value ==
                                    images[index];
                            return JRoundedImage(
                              fit: BoxFit.fill,
                              onPressed: () => controller
                                  .selectedProductImage.value = images[index],
                              isNetworkImage: true,
                              imageUrl: images[index],
                              backGroundColor:
                                  dark ? JColors.dark : JColors.white,
                              border: Border.all(
                                  color: imageSelected
                                      ? JColors.primary
                                      : Colors.transparent),
                              // padding: const EdgeInsets.all(TSizes.sm),
                              width: 80,
                            );
                          },
                        )),
              ),
            ),
            JAppBar(
              showBackArrow: true,
              actions: [
                JFavouriteIcon(
                  productId: product.id,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}