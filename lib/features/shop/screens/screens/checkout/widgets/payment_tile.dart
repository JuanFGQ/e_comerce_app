import 'package:e_comerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_comerce_app/features/shop/controllers/product/checkout_controller.dart';
import 'package:e_comerce_app/features/shop/models/payment_method_model.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class JPaymentTile extends StatelessWidget {
  const JPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckOutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymenthMethod.value = paymentMethod;
        Get.back();
      },
      leading: JRoundedContainer(
        width: 60,
        height: 40,
        backGroundColor:
            JHelperFunction.isDarkMode(context) ? JColors.light : JColors.white,
        padding: const EdgeInsets.all(JSizes.sm),
        widget: Image(
            image: AssetImage(paymentMethod.image.toString()),
            fit: BoxFit.contain),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}
