import 'package:e_comerce_app/common/widgets/products/cart/add_remove_icon.dart';
import 'package:e_comerce_app/common/widgets/products/cart/cart_item.dart';
import 'package:e_comerce_app/common/widgets/text/price_text.dart';
import 'package:e_comerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JCartItems extends StatelessWidget {
  const JCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });
  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        separatorBuilder: (_, __) =>
            const SizedBox(height: JSizes.spaceBtwSection),
        itemBuilder: (_, index) => Obx(() {
          final item = cartController.cartItems[index];
          return Column(
            children: [
              //CART ITEM
              JCartItem(cartItem: item),
              if (showAddRemoveButton)
                const SizedBox(height: JSizes.spaceBtwItems),

              //ADD REMOVE BUTTON WITH TOTAL PRICE
              if (showAddRemoveButton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        //add remove buttons
                        JProductQuantityWithAddRemove(
                          quantity: item.quantity,
                          add: () => cartController.addOneToCart(item),
                          remove: () => cartController.removeOneFromChart(item),
                        ),
                      ],
                    ),
                    //PRODUCT TOTAL PRICE
                    JProductPriceText(
                        price: (item.price * item.quantity).toStringAsFixed(1)),
                  ],
                )
            ],
          );
        }),
      ),
    );
  }
}
