import 'package:e_comerce_app/features/messages/screen/message.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class JMessagesIcon extends StatelessWidget {
  const JMessagesIcon({
    super.key,
    this.iconColor = JColors.white,
  });

  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    //Get an instance of the CartController
    // final controller = Get.put(CartController());

    final dark = JHelperFunction.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(() => const MessagesScreen()),
            icon: Icon(Iconsax.message,
                color: dark ? JColors.white : JColors.dark)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: JColors.black,
            ),
            child: Center(
                child: Text(
              '5',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: JColors.white, fontSizeFactor: 0.8),
            )
                // child: Obx(
                //   () => Text(
                //     '5',
                //     // '${controller.noOfCartItems.value}',
                //     style: Theme.of(context)
                //         .textTheme
                //         .bodyLarge!
                //         .apply(color: TColors.white, fontSizeFactor: 0.8),
                //   ),
                // ),
                ),
          ),
        )
      ],
    );
  }
}
