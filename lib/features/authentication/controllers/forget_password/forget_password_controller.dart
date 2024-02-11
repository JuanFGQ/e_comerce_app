import 'package:e_comerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_comerce_app/data/repositories/authentication_repository.dart';
import 'package:e_comerce_app/features/authentication/controllers/network/network_manager.dart';
import 'package:e_comerce_app/features/authentication/screens/authentication/forget_password/reset_password.dart';
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
      TFullScreenLoader.openLoadingDialog(
          'Processing your request...', TImages.handLoading);

      //CHECK INTERNET CONNECTIVITY
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //TRIGGER THE METHOD
      await AuthenticationRepository.instance.resetPassword(email.text.trim());

      //REMOVE LOADER
      TFullScreenLoader.stopLoading();

      //SHOW SUCCES SCREEN
      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sento to Reset your Password'.tr);

      //REDIRECT
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      //REMOVE LOADER
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      //START LOADING
      TFullScreenLoader.openLoadingDialog(
          'Processing your request...', TImages.handLoading);

      //CHECK INTERNET CONNECTIVITY
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //TRIGGER THE METHOD
      await AuthenticationRepository.instance.resetPassword(email);

      //REMOVE LOADER
      TFullScreenLoader.stopLoading();

      //SHOW SUCCES SCREEN
      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sento to Reset your Password'.tr);
    } catch (e) {
      //REMOVE LOADER
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
