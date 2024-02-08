import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_comerce_app/common/widgets/icon/circular_icon.dart';
import 'package:e_comerce_app/common/widgets/rounded_images/rounded_images.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return TCurvedEdgesWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            const SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(
                      child: Image(
                    image: AssetImage(TImages.onBoardingImage1),
                    fit: BoxFit.contain,
                  )),
                )),

            //IMAGE SLIDER
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 6,
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder: (context, index) {
                    return TRoundedImage(
                      imageUrl: TImages.lightAppLogo,
                      backGroundColor: dark ? TColors.dark : TColors.white,
                      border: Border.all(color: TColors.primary),
                      padding: const EdgeInsets.all(TSizes.sm),
                      width: 80,
                    );
                  },
                ),
              ),
            ),
            const TAppBar(
              showBackArrow: true,
              actions: [TCircularIcon(icon: Iconsax.heart5, color: Colors.red)],
            )
          ],
        ),
      ),
    );
  }
}
