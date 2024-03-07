import 'dart:io';

import 'package:e_comerce_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_comerce_app/common/widgets/icon/circular_icon.dart';
import 'package:e_comerce_app/common/widgets/rounded_images/rounded_images.dart';
import 'package:e_comerce_app/features/shop/controllers/product/new_product_controller.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class JAddImagesSlider extends StatelessWidget {
  const JAddImagesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunction.isDarkMode(context);
    final controller = Get.put(NewProductController());

    return JCurvedEdgesWidget(
      child: Container(
        color: dark ? JColors.darkGrey : JColors.light,
        child: Stack(
          children: [
            //!MAIN LARGE PRODUCT IMAGE
            SizedBox(
                height: 400,
                width: double.infinity,
                child: Padding(
                    padding:
                        const EdgeInsets.all(JSizes.productImageRadius * 2),
                    child: Obx(
                      () => Center(
                          //*imageuploading variable is always false, look later for the solution
                          child: controller.imageUploading.value
                              ? const CircularProgressIndicator()
                              : controller.selectedProductImage.value.isNotEmpty
                                  ? Image.file(
                                      File(controller
                                          .selectedProductImage.value),
                                      fit: BoxFit.fill)
                                  : Image.asset(JImages.lightAppLogo)),
                    ))),

            //!IMAGES STACK
            Positioned(
              right: 0,
              bottom: 30,
              left: JSizes.defaultSpace,
              child: SizedBox(
                width: double.infinity,
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //!HORIZONTAL IMAGES LIST

                    Flexible(
                      child: Obx(
                        () => ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: controller.previewImages.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: JSizes.spaceBtwItems),
                            itemBuilder: (_, index) => Obx(() {
                                  final imageSelected =
                                      controller.selectedProductImage.value ==
                                          controller.previewImages[index];

                                  return JRoundedImage(
                                    onPressed: () =>
                                        controller.selectedProductImage.value =
                                            controller.previewImages[index],
                                    fit: BoxFit.cover,
                                    localImage: true,
                                    width: 60,
                                    imageUrl: controller.previewImages[index],
                                    border: Border.all(
                                        color: imageSelected
                                            ? JColors.primary
                                            : Colors.transparent),
                                  );
                                })),
                      ),
                    ),
                    const SizedBox(width: JSizes.spaceBtwSection / 2),
                    Row(
                      children: [
                        //!CAPTURE IMAGES FROM GALLEY
                        JCircularIcon(
                            icon: Iconsax.gallery,
                            onPressed: () =>
                                controller.captureImages(ImageSource.gallery)),
                        const SizedBox(width: JSizes.spaceBtwItems / 2),
                        //!CAPTURE IMAGES FROM CAMERA

                        JCircularIcon(
                            icon: Iconsax.camera,
                            onPressed: () =>
                                controller.captureImages(ImageSource.camera)),
                        const SizedBox(width: JSizes.spaceBtwItems / 2),
                      ],
                    )
                  ],
                ),
              ),
            ),
            //!TRASH CAN BUTTON
            Positioned(
                right: 10,
                top: 10,
                child: JCircularIcon(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    backGroundColor: Colors.red,
                    icon: Iconsax.trash)),
          ],
        ),
      ),
    );
  }
}
