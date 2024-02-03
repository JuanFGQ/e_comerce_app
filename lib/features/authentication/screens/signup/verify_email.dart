import 'package:e_comerce_app/features/authentication/screens/login/login.dart';
import 'package:e_comerce_app/common/succes%20screen/success_screen.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/constants/text_strings.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            //IMAGE
            Image(
                image: const AssetImage(TImages.lightAppLogo),
                width: THelperFunction.screenWidth(context) * 0.6),
            const SizedBox(height: TSizes.spaceBtwSection),

            //TITLE and SUBTITLE
            Text(TTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text('pass by argument the user email dynamically',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(TTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: TSizes.spaceBtwSection),

            //BUTTONS
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    child: ElevatedButton(
                        onPressed: () => Get.to(() => SuccesScreen(
                              image: TImages.onBoardingImage1,
                              onPressed: () =>
                                  Get.to(() => const LoginScreen()),
                              subTitle: TTexts.yourAccountSubTitle,
                              title: TTexts.yourAccountTitle,
                            )),
                        child: const Text('Continue')))),
            const SizedBox(height: TSizes.spaceBtwItems),
            SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {},
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(TTexts.resendEmail)))),
          ],
        ),
      ),
    );
  }
}
