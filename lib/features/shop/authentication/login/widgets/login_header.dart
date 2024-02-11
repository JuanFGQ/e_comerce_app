import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
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
                AssetImage(dark ? TImages.darkAppLogo : TImages.lightAppLogo)),
        Text(TTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: TSizes.sm),
        Text(TTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium)
      ],
    );
  }
}
