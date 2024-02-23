import 'dart:ffi';

import 'package:e_comerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_comerce_app/data/repositories/autentication/authentication_repository.dart';
import 'package:e_comerce_app/data/repositories/products/products_repository.dart';
import 'package:e_comerce_app/features/authentication/controllers/network/network_manager.dart';
import 'package:e_comerce_app/features/shop/models/poduct_model.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class NewProductController extends GetxController {
  static NewProductController get instance => Get.find();

  RxString assingCategory = 'Animals'.obs;
  //image list
  RxList imagesList = [].obs;
  //numbers editings
  final salePrice = TextEditingController();
  final discountPrice = TextEditingController();
  final availableStock = TextEditingController();
  //strings editings
  final productName = TextEditingController();
  final productBrand = TextEditingController();
  final productDescription = TextEditingController();
  //repository
  final productRepository = Get.put(ProductRepository());
  //flags
  final isPublishPost = false.obs;

  void sortProducts(String sortOption) {
    assingCategory.value = sortOption;

    switch (sortOption) {
      case 'Animals':
        sortProducts('1');
        break;
      case 'Clothes':
        sortProducts('2');

        break;
      case 'Cosmetics':
        sortProducts('3');

        break;
      case 'Tools':
        sortProducts('4');

        break;

      case 'Electricity':
        sortProducts('5');

        break;
      case 'Electronics':
        sortProducts('6');

        break;
      case 'Furniture':
        sortProducts('7');

        break;
      case 'Jewelry':
        sortProducts('8');

        break;
      case 'Shoes':
        sortProducts('9');

        break;

      default:
        sortProducts('1');

      //Default sortin option, the fist of the list of options: Name
    }
  }

  void loadImages(ImageSource source) async {
    try {
      final image =
          await ImagePicker().pickImage(source: source, imageQuality: 70);

      if (image != null && isPublishPost.value != true) {
        imagesList.add(image);


        /* 
        - pick image
        - 
        - convert that system url in firestorage url 
        - parse 

        */ 
              }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Oh Snap!', message: 'Something went wrong');
    }
  }

  Future<void> uploadProducts() async {
    try {
      //start loading animation
      TFullScreenLoader.openLoadingDialog(
          'Uploading product', TImages.handLoading);

      //check internet conectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //flag
      isPublishPost.value = true;

      //upload the information
      await productRepository.uploadProduct(ProductModel(
        categoryId: //this value might come from JSelectedCategory  ,
        images: //todo: need a list of strings,so then its needed to get the url of each image selected,
          id: AuthenticationRepository.instance.authUser.uid,
          stock: int.tryParse(availableStock.text)!,
          price: double.tryParse(salePrice.text)!,
          salePrice: double.tryParse(discountPrice.text)!,
          title: productName.text,
          description: productDescription.text,
          thumbnail: '',
          productType: 'single'));

      //remove loader

      TFullScreenLoader.stopLoading();

      //show succes message
      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your Name has been updated');

      isPublishPost.value = false;
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
