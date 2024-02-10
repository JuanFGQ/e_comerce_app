import 'package:e_comerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_comerce_app/features/authentication/controllers/network_manager.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  ///variables
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  ///SIGNUP
  Future<void> signup() async {
    try {
      //start loading

      TFullScreenLoader.openLoadingDialog(
          'We are Processing your information', TImages.darkAppLogo);
      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //form validation

      if (signUpFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //privacy policy check

      //register user in the firebase Authentication & save user data in firestore

      //save autehnticated user data in the firebase firestore

      //show success message

      //move to verify email screen
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      //show some generic error to the use
    } finally {
      //remove loader
      TFullScreenLoader.stopLoading();
    }
  }
}
