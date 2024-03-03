import 'package:e_comerce_app/features/authentication/controllers/login/login/login_controller.dart';
import 'package:e_comerce_app/features/shop/authentication/forget_password/forget_password.dart';
import 'package:e_comerce_app/features/shop/authentication/signup/signup.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/constants/text_strings.dart';
import 'package:e_comerce_app/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class JLoginForm extends StatelessWidget {
  const JLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: JSizes.spaceBtwSection),
        child: Column(
          children: [
            //EMAIL
            TextFormField(
                validator: (value) => JValidator.validateEmail(value),
                controller: controller.email,
                decoration: const InputDecoration(
                    prefix: Icon(Iconsax.direct_right),
                    labelText: JTexts.email)),
            const SizedBox(height: JSizes.spaceBtwInputFields),
            //PASSWORD
            Obx(
              () => TextFormField(
                  obscureText: controller.hidePassword.value,
                  validator: (value) => JValidator.validatePassword(value),
                  controller: controller.password,
                  decoration: InputDecoration(
                      prefix: const Icon(Iconsax.password_check),
                      labelText: JTexts.password,
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye)))),
            ),
            const SizedBox(height: JSizes.spaceBtwInputFields / 2),

            //REMEMBER ME & FORGET PASSWORD
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(() => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value)),
                    const Text(JTexts.rememberMe)
                  ],
                ),
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(JTexts.forgetPassword))
              ],
            ),
            const SizedBox(height: JSizes.spaceBtwInputFields),
            //SIGN IN BUTTON
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    child: const Text(JTexts.signIn))),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const SignUpScreen()),
                    child: const Text(JTexts.createAccount))),
            const SizedBox(height: JSizes.spaceBtwInputFields),
          ],
        ),
      ),
    );
  }
}
