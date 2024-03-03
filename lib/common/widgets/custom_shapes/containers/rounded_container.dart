import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class JRoundedContainer extends StatelessWidget {
  const JRoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.radius = JSizes.cardRadiusLg,
      this.widget,
      this.showBorder = false,
      this.borderColor = JColors.primary,
      this.backGroundColor = JColors.white,
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
