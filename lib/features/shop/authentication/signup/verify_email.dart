import 'package:e_comerce_app/data/repositories/autentication/authentication_repository.dart';
import 'package:e_comerce_app/features/authentication/controllers/login/signup/verify_email_controller.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/constants/text_strings.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logOut(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(JSizes.defaultSpace),
        child: Column(
          children: [
            //IMAGE
            Image(
                image: const AssetImage(JImages.lightAppLogo),
                width: JHelperFunction.screenWidth(context) * 0.6),
            const SizedBox(height: JSizes.spaceBtwSection),

            //TITLE and SUBTITLE
            Text(JTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: JSizes.spaceBtwItems),
            Text(email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center),
            const SizedBox(height: JSizes.spaceBtwItems),
            Text(JTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: JSizes.spaceBtwSection),

            //BUTTONS
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.checkVerificationStatus(),
                    child: const Text('Continue'))),
            const SizedBox(height: JSizes.spaceBtwItems),
            SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {},
                    child: TextButton(
                        onPressed: () => controller.sendEmailVerification(),
                        child: const Text(JTexts.resendEmail)))),
          ],
        ),
      ),
    );
  }
}
