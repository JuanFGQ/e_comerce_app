import 'package:e_comerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_comerce_app/data/repositories/autentication/authentication_repository.dart';
import 'package:e_comerce_app/features/authentication/controllers/network/network_manager.dart';
import 'package:e_comerce_app/features/shop/authentication/forget_password/reset_password.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instace => Get.find();

  //variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //SEND RESET PASSWORD EMAIL

  sendPasswordResetEmail() async {
    try {
      //START LOADING
      JFullScreenLoader.openLoadingDialog(
          'Processing your request...', JImages.handLoading);

      //CHECK INTERNET CONNECTIVITY
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        JFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        JFullScreenLoader.stopLoading();
        return;
      }
      //TRIGGER THE METHOD
      await AuthenticationRepository.instance.resetPassword(email.text.trim());

      //REMOVE LOADER
      JFullScreenLoader.stopLoading();

      //SHOW SUCCES SCREEN
      JLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sento to Reset your Password'.tr);

      //REDIRECT
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      //REMOVE LOADER
      JFullScreenLoader.stopLoading();
      JLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      //START LOADING
      JFullScreenLoader.openLoadingDialog(
          'Processing your request...', JImages.handLoading);

      //CHECK INTERNET CONNECTIVITY
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        JFullScreenLoader.stopLoading();
        return;
      }

      //TRIGGER THE METHOD
      await AuthenticationRepository.instance.resetPassword(email);

      //REMOVE LOADER
      JFullScreenLoader.stopLoading();

      //SHOW SUCCES SCREEN
      JLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sento to Reset your Password'.tr);
    } catch (e) {
      //REMOVE LOADER
      JFullScreenLoader.stopLoading();
      JLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
