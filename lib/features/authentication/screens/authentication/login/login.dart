import 'package:e_comerce_app/common/styles/spacing_styles.dart';
import 'package:e_comerce_app/features/authentication/screens/authentication/login/widgets/form_divider.dart';
import 'package:e_comerce_app/features/authentication/screens/authentication/login/widgets/login_form.dart';
import 'package:e_comerce_app/features/authentication/screens/authentication/login/widgets/login_header.dart';
import 'package:e_comerce_app/features/authentication/screens/authentication/login/widgets/social_button.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/constants/text_strings.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //LOGO ,TITLE, HEADER
              TLoginHeader(dark: dark),
              // FORM
              const TLoginForm(),
              //DIVIDER
              TFormDivider(
                  dark: dark, dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSection),

              //FOOTER
              const TSocialButton()
            ],
          ),
        ),
      ),
    );
  }
}
