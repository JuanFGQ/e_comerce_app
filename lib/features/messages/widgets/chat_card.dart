import 'package:e_comerce_app/common/widgets/rounded_images/rounded_images.dart';
import 'package:e_comerce_app/features/messages/screen/chat_page.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const ChatPage()),
      child: Padding(
        padding: const EdgeInsets.only(top: TSizes.md),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //!USER IMAGE
                const TRoundedImage(
                    borderRadius: 60,
                    height: 60,
                    applyImageRadius: true,
                    width: 60,
                    imageUrl: TImages.clothes,
                    isNetworkImage: false),
                const SizedBox(width: TSizes.md),

                //!USER NAME
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //USER NAME
                      Text('MobileX',
                          style: Theme.of(context).textTheme.headlineMedium),
                      const SizedBox(height: TSizes.sm / 2),
                      //USER MESSAGE
                      Text(
                          'Proident magna duis ullamco nulla cupidatat laborum nostrud non. Sunt cillum enim velit do Lorem fugiat incididunt quis officia fugiat nisi commodo duis. Voluptate dolor et nostrud in excepteur amet sit. Dolor dolor quis sint irure cupidatat adipisicing culpa aliqua id. Ipsum ullamco commodo ipsum nisi pariatur aliqua pariatur.',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
                const SizedBox(width: TSizes.defaultSpace / 2),

                //!NOTIFICATION INFO
                Column(
                  children: [
                    //TIME STAMP MESSAGE
                    const Text('2 min ago'),

                    const SizedBox(height: TSizes.defaultSpace / 2),

                    //NOTIFICATION CIRCLE
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: TColors.accent,
                      ),
                      child: Center(
                          child: Text(
                        '5',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: TColors.white, fontSizeFactor: 0.8),
                      )),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: TSizes.defaultSpace / 2),
            const Divider(endIndent: 0, indent: 75)
          ],
        ),
      ),
    );
  }
}
