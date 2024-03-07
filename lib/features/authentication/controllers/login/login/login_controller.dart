import 'package:e_comerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_comerce_app/data/repositories/autentication/authentication_repository.dart';
import 'package:e_comerce_app/features/authentication/controllers/network/network_manager.dart';
import 'package:e_comerce_app/features/personalization/controller/user_controller.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  //VARIABLES
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());
  @override

  //!check this condition
  // void onInit() {
  //   if (localStorage.isNotEmpty) {
  //     email.text = localStorage.read('REMEMBER_ME_EMAIL');
  //     password.text = localStorage.read('REMEMBER_ME_PASSWORD');
  //   } else {
  //     email.text = '';
  //     password.text = '';
  //   }
  //   super.onInit();
  // }

  Future<void> emailAndPasswordSignIn() async {
    try {
//START LOADING
      JFullScreenLoader.openLoadingDialog(
          'Loggin you in...', JImages.handLoading);

      //CHECK INTERNET CONNECTIVITY
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        JFullScreenLoader.stopLoading();
        return;
      }

      //FORM VALIDATION
      if (!loginFormKey.currentState!.validate()) {
        JFullScreenLoader.stopLoading();
        return;
      }

      //SAVE DATA IF REMEMEBER ME IS SELECTED
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //LOGIN USER USING EMAIL & PASSWORD AUTHENTICATION
      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //REMOVE LOADER
      JFullScreenLoader.stopLoading();

      //REDIRECT
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      JFullScreenLoader.stopLoading();
      JLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      //Start Loading
      JFullScreenLoader.openLoadingDialog(
          'Logging you in...', JImages.handLoading);

      //CHECK INTERNET CONNECTITVITY
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        JFullScreenLoader.stopLoading();
        return;
      }

      //Google Authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      //save user record
      await userController.saveUserRecord(userCredentials);

      //remove Loader
      JFullScreenLoader.stopLoading();

      //redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      JFullScreenLoader.stopLoading();

      JLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
