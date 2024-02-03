import 'package:e_comerce_app/features/authentication/screens/forget_password/forget_password.dart';
import 'package:e_comerce_app/features/authentication/screens/signup/signup.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSection),
        child: Column(
          children: [
            //EMAIL
            TextFormField(
                decoration: const InputDecoration(
                    prefix: Icon(Iconsax.direct_right),
                    labelText: TTexts.email)),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            //PASSWORD
            TextFormField(
                decoration: const InputDecoration(
                    prefix: Icon(Iconsax.password_check),
                    labelText: TTexts.password)),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            //REMEMBER ME & FORGET PASSWORD
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TTexts.rememberMe)
                  ],
                ),
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(TTexts.forgetPassword))
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            //SIGN IN BUTTON
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text(TTexts.signIn))),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const SignUpScreen()),
                    child: const Text(TTexts.createAccount))),
            const SizedBox(height: TSizes.spaceBtwInputFields),
          ],
        ),
      ),
    );
  }
}
