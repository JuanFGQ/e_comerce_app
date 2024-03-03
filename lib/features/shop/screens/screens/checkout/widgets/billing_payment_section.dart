import 'package:e_comerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_comerce_app/common/widgets/text/section_header.dart';
import 'package:e_comerce_app/features/shop/controllers/product/checkout_controller.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JBillingPaymentSection extends StatelessWidget {
  const JBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckOutController());
    final dark = JHelperFunction.isDarkMode(context);
    return Column(
      children: [
        JSectionHeading(
            title: 'Payment Method',
            buttonTile: 'Change',
            showActionButton: true,
            onPressed: () => controller.selectPaymentMethod(context)),
        const SizedBox(height: JSizes.spaceBtwItems),
        Obx(
          () => Row(
            children: [
              JRoundedContainer(
                width: 60,
                height: 35,
                padding: const EdgeInsets.all(JSizes.sm),
                backGroundColor: dark ? JColors.light : JColors.white,
                widget: Image(
                    image: AssetImage(
                        controller.selectedPaymenthMethod.value.image),
                    fit: BoxFit.contain),
              ),
              const SizedBox(width: JSizes.spaceBtwItems / 2),
              Text(controller.selectedPaymenthMethod.value.name,
                  style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        )
      ],
    );
  }
}
