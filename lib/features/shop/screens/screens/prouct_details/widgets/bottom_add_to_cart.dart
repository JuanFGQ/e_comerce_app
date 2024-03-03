import 'package:e_comerce_app/common/widgets/icon/circular_icon.dart';
import 'package:e_comerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:e_comerce_app/features/shop/models/product_model.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class JBottomAddToCart extends StatelessWidget {
  const JBottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = JHelperFunction.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: JSizes.defaultSpace, vertical: JSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? JColors.darkGrey : JColors.accent,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(JSizes.cardRadiusLg),
              topRight: Radius.circular(JSizes.cardRadiusLg))),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Row(
                children: [
                  //MINUS PRODUCT BUTTON
                  JCircularIcon(
                    width: 40,
                    height: 40,
                    icon: Iconsax.minus,
                    backGroundColor: JColors.darkGrey,
                    color: JColors.white,
                    onPressed: () => controller.productQuantityInCart.value < 1
                        ? null
                        : controller.productQuantityInCart.value -= 1,
                  ),
                  const SizedBox(width: JSizes.spaceBtwItems),
                  //QUANTITY INDICATOR
                  Text(controller.productQuantityInCart.value.toString(),
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(width: JSizes.spaceBtwItems),
                  //PLUSS PRODUCT BUTTON
                  JCircularIcon(
                    width: 40,
                    height: 40,
                    icon: Iconsax.add,
                    backGroundColor: JColors.black,
                    color: JColors.white,
                    onPressed: () =>
                        controller.productQuantityInCart.value += 1,
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: controller.productQuantityInCart.value < 1
                    ? null
                    : () => controller.addCart(product),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(JSizes.md),
                    backgroundColor: JColors.black,
                    side: BorderSide(
                        color: controller.productQuantityInCart.value < 1
                            ? JColors.darkGrey
                            : JColors.white)),
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                      color: controller.productQuantityInCart.value < 1
                          ? JColors.darkGrey
                          : JColors.white),
                ))
          ],
        ),
      ),
    );
  }
}
