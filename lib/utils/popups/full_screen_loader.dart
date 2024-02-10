import 'package:e_comerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TFullScreenLoader {
  //open a full-screen loading dialog with a given text and animation
  //this methos doesn´t return anything

  ///parameters
  ///-Text : the text to be displayed in the loading dialog.
  ///-animation: the Lottie animation to be shown

  static void openLoadingDialog(String text, String animation) {
    showDialog(
        barrierDismissible: false,
        context: Get.overlayContext!,
        builder: (_) => PopScope(
            canPop: false,
            child: Container(
              color: THelperFunction.isDarkMode(Get.context!)
                  ? TColors.dark
                  : TColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 250),
                  TAnimationLoader(text: text, animation: animation)
                ],
              ),
            )));
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
