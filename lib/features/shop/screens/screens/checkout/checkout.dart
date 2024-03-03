import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_comerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_comerce_app/common/widgets/products/cart/coupon_widget.dart';
import 'package:e_comerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:e_comerce_app/features/shop/controllers/product/order_controller.dart';
import 'package:e_comerce_app/features/shop/screens/screens/cart/widgets/cart_items.dart';
import 'package:e_comerce_app/features/shop/screens/screens/checkout/widgets/billing_address_section.dart';
import 'package:e_comerce_app/features/shop/screens/screens/checkout/widgets/billing_ammount_section.dart';
import 'package:e_comerce_app/features/shop/screens/screens/checkout/widgets/billing_payment_section.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:e_comerce_app/utils/helpers/princing_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subtotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = JPricingCalculator.calculateTotalPrice(subtotal, 'EU');
    final dark = JHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: JAppBar(
        showBackArrow: true,
        title: Text(
          'Order review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(JSizes.defaultSpace),
          child: Column(
            children: [
              //ITEMS IN CART
              const JCartItems(showAddRemoveButton: false),
              const SizedBox(height: JSizes.defaultSpace),

              //COUPON TEXTFIELD
              const JCouponCode(),
              const SizedBox(height: JSizes.spaceBtwSection),

              /// BILLING SECTION
              JRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(JSizes.md),
                backGroundColor: dark ? JColors.black : JColors.white,
                widget: const Column(
                  children: [
                    //PRICING
                    JBillingAmountSection(),
                    SizedBox(height: JSizes.spaceBtwItems),
                    //DIVIDER
                    Divider(),
                    SizedBox(height: JSizes.spaceBtwItems),

                    //PAYMENT METHODS
                    JBillingPaymentSection(),
                    SizedBox(height: JSizes.spaceBtwItems),

                    //ADDRESS
                    JBillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(JSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: subtotal > 0
                ? () => orderController.processOrder(totalAmount)
                : JLoaders.warningSnackBar(
                    title: 'Empty Cart',
                    message: 'Add items in the cart in order to proceed'),
            child: Text('Checkout \$$totalAmount')),
      ),
    );
  }
}
