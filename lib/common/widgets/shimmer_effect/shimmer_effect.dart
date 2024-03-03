import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class JShimmerEffect extends StatelessWidget {
  const JShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
      this.raidus = 15,
      this.colors});

  final double width, height, raidus;
  final Color? colors;

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunction.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: colors ?? (dark ? JColors.grey : JColors.white),
            borderRadius: BorderRadius.circular(raidus)),
      ),
    );
  }
}
