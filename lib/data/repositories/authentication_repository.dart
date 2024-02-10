import 'package:e_comerce_app/features/authentication/screens/authentication/login/login.dart';
import 'package:e_comerce_app/features/authentication/screens/authentication/screen%20onboarding/onboarding.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final deviceStorage = GetStorage();

  //called from main.dart on app launch

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  ///Function to show relevant screen
  void screenRedirect() async {
    //local Storage

    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => LoginScreen())
        : Get.offAll(() => OnBoardingScreen());
  }
}

/*----------------------------------------Email & Password sign-in----------------------------------------*/

// [EmailAuthentication]- SignIn

//[EmailAuthentication]- Register

//[ReAuthenticate] - ReAuthenticate User

//[Email Verification] - Mail Verification

//[EmailAuthentication] - Forget Password

/*----------------------------------------Federated identity & socila sign-in----------------------------------------*/

//[GoogleAuthentication] - GOOGLE

//[FacebookAuthentication]  - FACEBOOK

/*----------------------------------------end Federated identity & social sign in----------------------------------------*/
