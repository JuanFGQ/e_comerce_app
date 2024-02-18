import 'package:e_comerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:e_comerce_app/features/shop/screens/screens/cart/cart.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    this.iconColor = TColors.white,
  });

  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    //Get an instance of the CartController
    final controller = Get.put(CartController());

    final dark = THelperFunction.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(() => const CartScreen()),
            icon: Icon(Iconsax.shopping_bag,
                color: dark ? TColors.white : TColors.dark)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: TColors.black,
            ),
            child: Center(
              child: Obx(
                () => Text(
                  '${controller.noOfCartItems.value}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: TColors.white, fontSizeFactor: 0.8),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
