import 'package:e_comerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:e_comerce_app/features/shop/screens/screens/cart/cart.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class JCartCounterIcon extends StatelessWidget {
  const JCartCounterIcon({
    super.key,
    this.iconColor = JColors.white,
  });

  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    //Get an instance of the CartController
    final controller = Get.put(CartController());

    final dark = JHelperFunction.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(() => const CartScreen()),
            icon: Icon(Iconsax.shopping_bag,
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
              child: Obx(
                () => Text(
                  '${controller.noOfCartItems.value}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: JColors.white, fontSizeFactor: 0.8),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
