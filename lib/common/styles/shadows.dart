import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: JColors.darkGrey.withOpacity(0.1),
      blurRadius: 1,
      spreadRadius: 1,
      offset: const Offset(0, 1));

  static final horizontalProductShadow = BoxShadow(
      color: JColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
