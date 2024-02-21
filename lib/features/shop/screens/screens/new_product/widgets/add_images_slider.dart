import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_comerce_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_comerce_app/common/widgets/icon/circular_icon.dart';
import 'package:e_comerce_app/common/widgets/rounded_images/rounded_images.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class JAddImagesSlider extends StatelessWidget {
  const JAddImagesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);

    return TCurvedEdgesWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            //MAIN LARGE PRODUCT IMAGE
            const SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(
                    child: Image(image: AssetImage(TImages.darkAppLogo)),
                  ),
                )),

//IMAGES LIST
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                width: double.infinity,
                height: 80,
                child: Row(
                  children: [
                    Flexible(
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: 5,
                          // images.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: TSizes.spaceBtwItems),
                          itemBuilder: (_, index) =>
                              // Image(image: AssetImage(TImages.facebook)),
                              const TRoundedImage(
                                  width: 60, imageUrl: TImages.facebook)),
                    ),
                    const SizedBox(width: TSizes.spaceBtwSection / 2),
                    TCircularIcon(
                      icon: Iconsax.gallery,
                      onPressed: () {
                        //take picture from gallery
                      },
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems / 2),
                    const TCircularIcon(icon: Iconsax.camera),
                    const SizedBox(width: TSizes.spaceBtwItems / 2),
                  ],
                ),
              ),
            ),
//TRASH CAN BUTTON
            Positioned(
                right: 10,
                top: 10,
                child: TCircularIcon(
                    backGroundColor: Colors.red, icon: Iconsax.trash)),
          ],
        ),
      ),
    );
  }
}
