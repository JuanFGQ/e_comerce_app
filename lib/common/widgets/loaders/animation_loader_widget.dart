// widget for displaying an animated loading indicator with optional text and action button
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class JAnimationControllerWidget extends StatelessWidget {
  const JAnimationControllerWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionProssed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionProssed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width * 0.8),
          const SizedBox(height: JSizes.defaultSpace),
          Text(text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center),
          const SizedBox(height: JSizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                      onPressed: onActionProssed,
                      style: OutlinedButton.styleFrom(
                          backgroundColor: JColors.dark),
                      child: Text(
                        actionText ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: JColors.light),
                      )),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
