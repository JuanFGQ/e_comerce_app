import 'package:e_comerce_app/features/shop/authentication/login/widgets/form_divider.dart';
import 'package:e_comerce_app/features/shop/authentication/login/widgets/social_button.dart';
import 'package:e_comerce_app/features/shop/authentication/signup/widgets/sign_up_form.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/constants/text_strings.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(JSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TITLE
              Text(JTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: JSizes.spaceBtwSection),
              //FORM
              const SignUpForm(),
              //DIVIDER
              JFormDivider(
                  dark: dark, dividerText: JTexts.orSignUpWith.capitalize!),
              const SizedBox(height: JSizes.spaceBtwSection),

              //SOCIAL BUTTONS
              const JSocialButton()
            ],
          ),
        ),
      ),
    );
  }
}
