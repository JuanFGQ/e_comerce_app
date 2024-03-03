import 'package:e_comerce_app/features/authentication/controllers/login/login/login_controller.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JSocialButton extends StatelessWidget {
  const JSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //GOOGLE SIGN IN BUTTON
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
              border: Border.all(color: JColors.grey)),
          child: IconButton(
              onPressed: () => controller.googleSignIn(),
              icon: const Image(
                  width: JSizes.iconMd,
                  height: JSizes.iconMd,
                  image: AssetImage(JImages.google))),
        ),
        const SizedBox(width: JSizes.spaceBtwItems),
        //FACEBOOK SIGN IN BUTTON

        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
              border: Border.all(color: JColors.grey)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                  width: JSizes.iconMd,
                  height: JSizes.iconMd,
                  image: AssetImage(JImages.facebook))),
        )
      ],
    );
  }
}
