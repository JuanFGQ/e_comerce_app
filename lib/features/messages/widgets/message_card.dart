import 'package:e_comerce_app/common/widgets/rounded_images/rounded_images.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    super.key,
    required this.photoUrl,
    required this.userName,
    required this.message,
    required this.alignment,
    // required this.timeStamp,
  });
  final String photoUrl;
  final String userName;
  final String message;
  final CrossAxisAlignment alignment;
  // final String timeStamp;

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: alignment,
      children: [
        //!USER MESSAGE
        Container(
          width: 300,
          decoration: BoxDecoration(
              color: dark ? JColors.accent : JColors.light,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(30),
                  topRight: Radius.circular(7))),
          child: Padding(
            padding: const EdgeInsets.all(JSizes.sm),
            child: Column(
              children: [
                Row(
                  children: [
                    //!USER NAME AND IMAGE
                    JRoundedImage(
                        borderRadius: 35,
                        height: 35,
                        applyImageRadius: true,
                        width: 35,
                        imageUrl: photoUrl.contains('http')
                            ? photoUrl
                            : JImages.userImage,
                        isNetworkImage:
                            photoUrl.contains('http') ? true : false),
                    const SizedBox(width: JSizes.defaultSpace / 2),
                    Text(userName)
                  ],
                ),
                const SizedBox(height: JSizes.defaultSpace / 2),
                Text(message),
              ],
            ),
          ),
        ),
        const SizedBox(height: JSizes.sm),
        // Text(timeStamp,
        //     style: Theme.of(context)
        //         .textTheme
        //         .bodySmall!
        //         .copyWith(fontSize: 10)
        //         .apply())
      ],
    );
  }
}
