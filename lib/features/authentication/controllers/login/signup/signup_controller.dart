import 'package:e_comerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_comerce_app/data/repositories/autentication/authentication_repository.dart';
import 'package:e_comerce_app/data/repositories/user/user_repository.dart';
import 'package:e_comerce_app/features/authentication/controllers/network/network_manager.dart';
import 'package:e_comerce_app/features/authentication/models/user/user_model.dart';
import 'package:e_comerce_app/features/shop/authentication/signup/verify_email.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  ///variables

  final privacyPolicy = false.obs;

  final hidePassword = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  ///SIGNUP
  void signup() async {
    try {
      //start loading

      JFullScreenLoader.openLoadingDialog(
          'We are Processing your information', JImages.handLoading);
      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        JFullScreenLoader.stopLoading();
        return;
      }

      //form validation

      if (!signUpFormKey.currentState!.validate()) {
        JFullScreenLoader.stopLoading();

        return;
      }

      //privacy policy check
      if (!privacyPolicy.value) {
        JFullScreenLoader.stopLoading();

        JLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the privacy policy & terms of use');
        return;
      }

      //register user in the firebase Authentication & save user data in firestore
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //save autehnticated user data in the firebase firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //show success message
      JLoaders.successSnackBar(
          title: 'Congrats',
          message: 'Your accouns has been created,verify email to continue.');

      //move to verify email screen
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      //remove loader
      JFullScreenLoader.stopLoading();

      //show generic errors
      JLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
