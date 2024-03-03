import 'package:e_comerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/princing_calculator.dart';
import 'package:flutter/material.dart';

class JBillingAmountSection extends StatelessWidget {
  const JBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;

    return Column(
      children: [
        //SUBTOTAL
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$$subTotal', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: JSizes.spaceBtwItems / 2),

        //SHIPPING FEE
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shippin Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text(
                '\$${JPricingCalculator.calculateShippingCost(subTotal, 'EUR')}',
                style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: JSizes.spaceBtwItems / 2),

        //!TAX FEE
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
        //     Text('\$${TPricingCalculator.calculateTax(subTotal, 'EUR')}',
        //         style: Theme.of(context).textTheme.labelLarge),
        //   ],
        // ),
        const SizedBox(height: JSizes.spaceBtwItems),

        //TOTAL ORDER
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total Order',
                style: Theme.of(context).textTheme.headlineMedium),
            Text('\$${JPricingCalculator.calculateTotalPrice(subTotal, 'EUR')}',
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
