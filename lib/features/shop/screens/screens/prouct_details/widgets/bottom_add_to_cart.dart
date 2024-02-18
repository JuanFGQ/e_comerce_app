import 'package:e_comerce_app/common/widgets/icon/circular_icon.dart';
import 'package:e_comerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:e_comerce_app/features/shop/models/poduct_model.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = THelperFunction.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? TColors.darkerGrey : TColors.light,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(TSizes.cardRadiusLg),
              topRight: Radius.circular(TSizes.cardRadiusLg))),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Row(
                children: [
                  //MINUS PRODUCT BUTTON
                  TCircularIcon(
                    width: 40,
                    height: 40,
                    icon: Iconsax.minus,
                    backGroundColor: TColors.darkGrey,
                    color: TColors.white,
                    onPressed: () => controller.productQuantityInCart.value < 1
                        ? null
                        : controller.productQuantityInCart.value -= 1,
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  //QUANTITY INDICATOR
                  Text(controller.productQuantityInCart.value.toString(),
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  //PLUSS PRODUCT BUTTON
                  TCircularIcon(
                    width: 40,
                    height: 40,
                    icon: Iconsax.add,
                    backGroundColor: TColors.black,
                    color: TColors.white,
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
                    padding: const EdgeInsets.all(TSizes.md),
                    backgroundColor: TColors.black,
                    side: const BorderSide(color: TColors.black)),
                child: const Text('Add to Cart'))
          ],
        ),
      ),
    );
  }
}
