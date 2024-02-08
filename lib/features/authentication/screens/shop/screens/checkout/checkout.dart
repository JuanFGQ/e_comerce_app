import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_comerce_app/features/authentication/screens/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //ITEMS IN CART
              TCartItems(showAddRemoveButton: false),
              SizedBox(height: TSizes.defaultSpace),

              //coupon textField
              CRoundedContainer(
                showBorder: true,
                backGroundColor: dark ? TColors.light : TColors.white,
                padding: EdgeInsets.only(
                    top: TSizes.sm, bottom: TSizes.sm, left: TSizes.sm),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
