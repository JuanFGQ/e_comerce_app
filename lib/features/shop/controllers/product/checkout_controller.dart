import 'package:e_comerce_app/common/widgets/text/section_header.dart';
import 'package:e_comerce_app/features/shop/models/payment_method_model.dart';
import 'package:e_comerce_app/features/shop/screens/screens/checkout/widgets/payment_tile.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  static CheckOutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymenthMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymenthMethod.value =
        PaymentMethodModel(image: TImages.paypal, name: 'Paypal');
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TSectionHeading(
                        title: 'Select Payment Method',
                        showActionButton: false),
                    const SizedBox(height: TSizes.spaceBtwSection),

                    //PAYMENT OPTION
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: TImages.paypal, name: 'PayPal')),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: TImages.googlePay, name: 'Google Pay')),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: TImages.applePay, name: 'Apple Pay')),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: TImages.visa, name: 'VISA')),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: TImages.mastercard, name: 'Mastercard')),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    // TPaymentTile(
                    //     paymentMethod: PaymentMethodModel(
                    //         image: 'Paytm', name: TImages.google)),
                    // const SizedBox(height: TSizes.spaceBtwItems / 2),
                    // TPaymentTile(
                    //     paymentMethod: PaymentMethodModel(
                    //         image: 'Paystack', name: TImages.google)),
                    // const SizedBox(height: TSizes.spaceBtwItems / 2),
                    // TPaymentTile(
                    //     paymentMethod: PaymentMethodModel(
                    //         image: 'Credit Card', name: TImages.google)),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    const SizedBox(height: TSizes.spaceBtwSection),
                  ],
                ),
              ),
            ));
  }
}
