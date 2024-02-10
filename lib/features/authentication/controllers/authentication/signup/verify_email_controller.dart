import 'dart:async';

import 'package:e_comerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_comerce_app/common/widgets/succes%20screen/success_screen.dart';
import 'package:e_comerce_app/data/repositories/authentication_repository.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  //SEND EMAIL WHENEVER VERIFY SCREEN APPEARS & SET TIME FOR AUTO REDIRECT
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }
  //SEND EMAIL VERIFICATION LINK

  void sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Please Check your inbox and verify your email.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //TIMER TO AUTOMATICALLY REDIRECT ON EMAIL VERIFICATION
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccesScreen(
              image: TImages.successCheck,
              title: TTexts.yourAccountTitle,
              subTitle: TTexts.yourAccountSubTitle,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ));
      }
    });
  }

  //MANUALLY CHECK IF EMAIL VERIFIED
  checkVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccesScreen(
            image: TImages.successCheck,
            title: TTexts.yourAccountTitle,
            subTitle: TTexts.yourAccountSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ));
    }
  }
}
