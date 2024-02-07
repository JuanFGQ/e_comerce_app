import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CRoundedContainer extends StatelessWidget {
  const CRoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.radius = TSizes.cardRadiusLg,
      this.widget,
      this.showBorder = false,
      this.borderColor = TColors.primary,
      this.backGroundColor = TColors.white,
      this.padding,
      this.margin});
  final double? width;
  final double? height;
  final double radius;
  final Widget? widget;
  final bool showBorder;
  final Color borderColor;
  final Color backGroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backGroundColor,
          border: showBorder ? Border.all(color: borderColor) : null),
      child: widget,
    );
  }
}