import 'package:e_comerce_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          // PRODUCT IMAGE SLIDER
          TCurvedEdgesWidget(
            child: Container(
              color: dark ? TColors.darkGrey : TColors.light,
              child: Stack(
                children: [
                  SizedBox(
                      height: 400,
                      child: Padding(
                        padding:
                            const EdgeInsets.all(TSizes.productImageRadius),
                        child:
                            Image(image: AssetImage(TImages.onBoardingImage1)),
                      )),
                ],
              ),
            ),
          )

          //PRODUCT DETAILS
        ]),
      ),
    );
  }
}
