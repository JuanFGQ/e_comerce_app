import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class JCircularIcon extends StatelessWidget {
  const JCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = JSizes.lg,
    required this.icon,
    this.color,
    this.backGroundColor,
    this.onPressed,
    this.margin,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backGroundColor;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backGroundColor ??
            (JHelperFunction.isDarkMode(context)
                ? JColors.white.withOpacity(0.9)
                : JColors.black.withOpacity(0.9)),
      ),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: color ??
                (JHelperFunction.isDarkMode(context)
                    ? JColors.black.withOpacity(0.9)
                    : JColors.white.withOpacity(0.9)),
          )),
    );
  }
}
