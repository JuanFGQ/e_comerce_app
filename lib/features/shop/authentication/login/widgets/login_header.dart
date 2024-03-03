import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class JLoginHeader extends StatelessWidget {
  const JLoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            height: 150,
            image:
                AssetImage(dark ? JImages.darkAppLogo : JImages.lightAppLogo)),
        Text(JTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: JSizes.sm),
        Text(JTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium)
      ],
    );
  }
}
