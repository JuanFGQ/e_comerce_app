import 'package:e_comerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_comerce_app/data/repositories/autentication/authentication_repository.dart';
import 'package:e_comerce_app/data/repositories/user/user_repository.dart';
import 'package:e_comerce_app/features/authentication/controllers/network/network_manager.dart';
import 'package:e_comerce_app/features/authentication/models/user/user_model.dart';
import 'package:e_comerce_app/features/personalization/screen/profile/widgets/re_authenticate_user_login.dart';
import 'package:e_comerce_app/features/shop/authentication/login/login.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/firebasestorage/upload_image.dart';
import 'package:e_comerce_app/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final imageUploading = false.obs;
  final hidePassword = true.obs;
  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());
  final firestore = Get.put(JFireStorageMethods());
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  //save user record from any registration provider

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      //First Update Rx User and then check if user data is already stored. If not store new data
      await fetchUserRecord();
      //if no record already stored
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          //convert Name to first and last name
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final userName = UserModel.generateUsername(
              userCredentials.user!.displayName ?? '');

          //map data

          final user = UserModel(
              id: userCredentials.user!.uid,
              firstName: nameParts[0],
              lastName:
                  nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
              username: userName,
              email: userCredentials.user!.phoneNumber ?? '',
              phoneNumber: userCredentials.user!.phoneNumber ?? '',
              profilePicture: userCredentials.user!.photoURL ?? '');

          //SAVE USER DATA
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your Profile.');
    }
  }

  //DELETE ACCOUNT WARNING

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure you want to delete your account permanently? This action is not reversible and all your data will be removed permanently.',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
            child: Text('Delete'),
          ),
        ),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('cancel')));
  }

  //delete user account
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.handLoading);

      //FIRST RE-AUTHENTICATE USER
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        //Re verify auth email

        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReauthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //Re authenticare before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.handLoading);

      //check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());

      await AuthenticationRepository.instance.deleteAccount();

      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //Upload profile Image

  uploadProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);

      if (image != null) {
        imageUploading.value = true;
        //upload image
        final imageUrl =
            await firestore.uploadImage('Users/Images/Profile', image);

        //Update User Image Record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};

        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        //trigger a refreshing of the screen this is a method from getx controller
        user.refresh();
        TLoaders.successSnackBar(
            title: 'Congratulations',
            message: 'Your Profile Image has been updated');
      }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Oh Snap!', message: 'Somenthing went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }
}
