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
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TITLE
              Text(TTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSection),
              //FORM
              const SignUpForm(),
              //DIVIDER
              TFormDivider(
                  dark: dark, dividerText: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSection),

              //SOCIAL BUTTONS
              const TSocialButton()
            ],
          ),
        ),
      ),
    );
  }
}
