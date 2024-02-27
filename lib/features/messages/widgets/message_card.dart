import 'package:e_comerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_comerce_app/common/widgets/rounded_images/rounded_images.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
//!USER MESSAGE
        Container(
          width: 300,
          decoration: BoxDecoration(
              color: dark ? TColors.accent : TColors.light,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(30),
                  topRight: Radius.circular(7))),
          child: const Padding(
            padding: EdgeInsets.all(TSizes.sm),
            child: Column(
              children: [
                Row(
                  children: [
                    //!USER NAME AND IMAGE
                    TRoundedImage(
                        borderRadius: 35,
                        height: 35,
                        applyImageRadius: true,
                        width: 35,
                        imageUrl: TImages.clothes,
                        isNetworkImage: false),
                    SizedBox(width: TSizes.defaultSpace / 2),
                    Text('Juanito')
                  ],
                ),
                SizedBox(height: TSizes.defaultSpace / 2),
                Text(
                    'Labore consectetur est aute irure nostrud occaecat culpa nulla aute officia quis est laboris velit. Voluptate duis cillum veniam nostrud magna non Lorem consectetur id aliqua velit. Fugiat esse voluptate commodo irure nulla quis sunt do. Aliquip aute ullamco sint irure Lorem aliqua occaecat reprehenderit aute sunt do mollit. Nostrud nostrud irure quis ex non incididunt ad laborum id. Duis adipisicing sit incididunt laborum consectetur magna. Aute aliquip aute ex exercitation ipsum magna proident.'),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.sm),
        Text('15 min ago',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 10)
                .apply())
      ],
    );
  }
}
