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
    final totalAmount = TPricingCalculator.calculateTotalPrice(subtotal, 'EU');
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //ITEMS IN CART
              const TCartItems(showAddRemoveButton: false),
              const SizedBox(height: TSizes.defaultSpace),

              //COUPON TEXTFIELD
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSection),

              /// BILLING SECTION
              CRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backGroundColor: dark ? TColors.black : TColors.white,
                widget: const Column(
                  children: [
                    //PRICING
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    //DIVIDER
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //PAYMENT METHODS
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //ADDRESS
                    TBillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: subtotal > 0
                ? () => orderController.processOrder(totalAmount)
                : TLoaders.warningSnackBar(
                    title: 'Empty Cart',
                    message: 'Add items in the cart in order to proceed'),
            child: Text('Checkout \$$totalAmount')),
      ),
    );
  }
}
