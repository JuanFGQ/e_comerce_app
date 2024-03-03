import 'package:e_comerce_app/features/authentication/controllers/login/signup/signup_controller.dart';
import 'package:e_comerce_app/features/shop/authentication/signup/widgets/term_conditions.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/constants/text_strings.dart';
import 'package:e_comerce_app/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signUpFormKey,
      child: Column(
        children: [
          //first name
          //last name
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                      validator: (value) =>
                          JValidator.validateEmptyText('First name', (value)),
                      controller: controller.firstName,
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: JTexts.firstName,
                          prefixIcon: Icon(Iconsax.user)))),
              const SizedBox(width: JSizes.spaceBtwInputFields),
              Expanded(
                  child: TextFormField(
                      validator: (value) =>
                          JValidator.validateEmptyText('Last name', (value)),
                      controller: controller.lastName,
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: JTexts.lastName,
                          prefixIcon: Icon(Iconsax.user)))),
            ],
          ),
          const SizedBox(height: JSizes.spaceBtwInputFields),

          ///Username
          TextFormField(
              validator: (value) =>
                  JValidator.validateEmptyText('User name', (value)),
              controller: controller.username,
              expands: false,
              decoration: const InputDecoration(
                  labelText: JTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit))),
          const SizedBox(height: JSizes.spaceBtwInputFields),

          //EMAIL
          TextFormField(
              validator: (value) => JValidator.validateEmail(value),
              controller: controller.email,
              expands: false,
              decoration: const InputDecoration(
                  labelText: JTexts.email, prefixIcon: Icon(Iconsax.direct))),
          const SizedBox(height: JSizes.spaceBtwInputFields),

          //PHONE NUMBER
          TextFormField(
              keyboardType: TextInputType.number,
              validator: (value) => JValidator.validatePhoneNumber(value),
              controller: controller.phoneNumber,
              expands: false,
              decoration: const InputDecoration(
                  labelText: JTexts.phoneNo, prefixIcon: Icon(Iconsax.call))),
          const SizedBox(height: JSizes.spaceBtwInputFields),
          //PASSWORD
          Obx(
            () => TextFormField(
                validator: (value) => JValidator.validatePassword(value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                expands: false,
                decoration: InputDecoration(
                    labelText: JTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye)))),
          ),
          const SizedBox(height: JSizes.spaceBtwInputFields),

          //TERMS AND CONDITIONS CHECK BOX

          const TermsAndConditions(),
          const SizedBox(height: JSizes.spaceBtwInputFields),

          //SIGNUP BUTTON
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  child: const Text(JTexts.createAccount)))
        ],
      ),
    );
  }
}
