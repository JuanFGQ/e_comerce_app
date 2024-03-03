import 'package:e_comerce_app/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/constants/text_strings.dart';
import 'package:e_comerce_app/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(JSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //HEADING
            Text(JTexts.forgetPasswordTittle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: JSizes.spaceBtwItems),
            Text(JTexts.forgetPasswordSubtitle,
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: JSizes.spaceBtwSection * 2),

            //TEXT FIELD
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                  controller: controller.email,
                  validator: JValidator.validateEmail,
                  decoration: const InputDecoration(
                      label: Text(JTexts.email),
                      prefixIcon: Icon(Iconsax.direct))),
            ),
            const SizedBox(height: JSizes.spaceBtwSection),

            //SUBMIT BUTTON
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.sendPasswordResetEmail(),
                    child: const Text('Submit')))
          ],
        ),
      ),
    );
  }
}
