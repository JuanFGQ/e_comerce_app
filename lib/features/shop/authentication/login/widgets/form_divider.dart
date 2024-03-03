import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class JFormDivider extends StatelessWidget {
  final String dividerText;
  const JFormDivider({
    super.key,
    required this.dark,
    required this.dividerText,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
                color: dark ? JColors.darkGrey : JColors.grey,
                thickness: 0.5,
                indent: 60,
                endIndent: 5)),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium),
        Flexible(
            child: Divider(
                color: dark ? JColors.darkGrey : JColors.grey,
                thickness: 0.5,
                indent: 5,
                endIndent: 60)),
      ],
    );
  }
}
