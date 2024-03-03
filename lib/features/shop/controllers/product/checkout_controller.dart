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
        PaymentMethodModel(image: JImages.paypal, name: 'Paypal');
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => Padding(
              padding: const EdgeInsets.all(JSizes.defaultSpace),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const JSectionHeading(
                        title: 'Select Payment Method',
                        showActionButton: false),
                    const SizedBox(height: JSizes.spaceBtwSection),

                    //PAYMENT OPTION
                    JPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: JImages.paypal, name: 'PayPal')),
                    const SizedBox(height: JSizes.spaceBtwItems / 2),
                    JPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: JImages.googlePay, name: 'Google Pay')),
                    const SizedBox(height: JSizes.spaceBtwItems / 2),
                    JPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: JImages.applePay, name: 'Apple Pay')),
                    const SizedBox(height: JSizes.spaceBtwItems / 2),
                    JPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: JImages.visa, name: 'VISA')),
                    const SizedBox(height: JSizes.spaceBtwItems / 2),
                    JPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: JImages.mastercard, name: 'Mastercard')),
                    const SizedBox(height: JSizes.spaceBtwItems / 2),
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
                    const SizedBox(height: JSizes.spaceBtwItems / 2),
                    const SizedBox(height: JSizes.spaceBtwSection),
                  ],
                ),
              ),
            ));
  }
}
