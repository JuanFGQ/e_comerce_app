import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetWorkImage = false,
    this.overlayColor,
    this.backGroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = TSizes.md,
  });
  final BoxFit? fit;
  final String image;
  final bool isNetWorkImage;
  final Color? overlayColor;
  final Color? backGroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: THelperFunction.isDarkMode(context)
              ? TColors.black
              : TColors.white),
      child: Image(
          fit: fit,
          image: isNetWorkImage
              ? NetworkImage(image)
              : AssetImage(image) as ImageProvider,
          color: overlayColor
          // THelperFunction.isDarkMode(context) ? TColors.light : TColors.black,
          ),
    );
  }
}
