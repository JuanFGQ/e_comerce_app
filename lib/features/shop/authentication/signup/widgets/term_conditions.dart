import 'package:e_comerce_app/features/authentication/controllers/login/signup/signup_controller.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/constants/text_strings.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final dark = JHelperFunction.isDarkMode(context);

    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) {
                  controller.privacyPolicy.value = value!;
                }))),
        const SizedBox(height: JSizes.spaceBtwItems),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: JTexts.iAgreeTo,
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: JTexts.privacyPolicy,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? JColors.white : JColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? JColors.white : JColors.primary)),
          TextSpan(text: 'AND', style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: JTexts.termsOfUse,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? JColors.white : JColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? JColors.white : JColors.primary)),
        ]))
      ],
    );
  }
}
