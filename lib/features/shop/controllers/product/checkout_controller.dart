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
        PaymentMethodModel(image: TImages.loadingAnim, name: 'Paypal');
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
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
                            image: 'PayPal', name: TImages.google)),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: 'Google Pay', name: TImages.google)),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: 'Apple Pay', name: TImages.google)),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: 'VISA', name: TImages.google)),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: 'Master Card', name: TImages.google)),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: 'Paytm', name: TImages.google)),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: 'Paystack', name: TImages.google)),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: 'Credit Card', name: TImages.google)),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    const SizedBox(height: TSizes.spaceBtwSection),
                  ],
                ),
              ),
            ));
  }
}
