import 'package:e_comerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_comerce_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class JPrimaryHeaderContainer extends StatelessWidget {
  const JPrimaryHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return JCurvedEdgesWidget(
      child: Container(
        color: JHelperFunction.isDarkMode(context)
            ? JColors.dark
            : JColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: JCircularContainer(
                  backGroundColor: JColors.textWhite.withOpacity(0.1)),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: JCircularContainer(
                  backGroundColor: JColors.textWhite.withOpacity(0.1)),
            ),
            child
          ],
        ),
      ),
    );
  }
}
