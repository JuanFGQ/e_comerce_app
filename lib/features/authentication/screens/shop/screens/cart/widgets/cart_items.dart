import 'package:e_comerce_app/common/widgets/products/cart/add_remove_icon.dart';
import 'package:e_comerce_app/common/widgets/products/cart/cart_item.dart';
import 'package:e_comerce_app/common/widgets/text/price_text.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });
  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 20,
      separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwSection),
      itemBuilder: (_, index) => Column(
        children: [
          //CART ITEM
          TCartItem(),
          if (showAddRemoveButton) SizedBox(height: TSizes.spaceBtwItems),

          //ADD REMOVE BUTTON WITH TOTAL PRICE
          if (showAddRemoveButton)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 70),
                    //add remove buttons
                    TProductQuantityWithAddRemove(),
                  ],
                ),
                //PRODUCT TOTAL PRICE
                TProductPriceText(price: '195')
              ],
            )
        ],
      ),
    );
  }
}
