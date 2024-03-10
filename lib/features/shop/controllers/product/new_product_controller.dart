import 'package:e_comerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_comerce_app/data/repositories/autentication/authentication_repository.dart';
import 'package:e_comerce_app/data/repositories/products/products_repository.dart';
import 'package:e_comerce_app/features/authentication/controllers/network/network_manager.dart';
import 'package:e_comerce_app/features/personalization/controller/user_controller.dart';
import 'package:e_comerce_app/features/shop/models/brand_model.dart';
import 'package:e_comerce_app/features/shop/models/product_model.dart';
import 'package:e_comerce_app/navigation_menu.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/firebasestorage/upload_image.dart';
import 'package:e_comerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NewProductController extends GetxController {
  static NewProductController get instance => Get.find();

  RxString assingCategory = 'Animals'.obs;
  //*image list
  RxList<String> previewImages = <String>[].obs;
  //*numbers editings
  final salePrice = TextEditingController();
  final discountPrice = TextEditingController();
  final availableStock = TextEditingController();
  //*strings editings
  final productName = TextEditingController();
  final productBrand = TextEditingController();
  final productDescription = TextEditingController();
  //*repository
  final productRepository = Get.put(ProductRepository());
  final firestore = Get.put(JFireStorageMethods());
  final navigationMenuController = NavigationController.instance;
  //*flags
  final isPublishPost = false.obs;
  RxBool imageUploading = false.obs;
  //*selecting flags
  RxString selectedProductImage = ''.obs;
  RxString selectedCategory = ''.obs;
  //*Lists
  final List<XFile> xfileList = [];
  //*FormKey
  GlobalKey<FormState> newProductFormKey = GlobalKey<FormState>();
  //*Instances
  final userInfoInsta = UserController.instance;

  //!GET CATEGORY ID
  void setCategoryId(String sortOption) {
    assingCategory.value = sortOption;

    switch (sortOption) {
      case 'Animals':
        // setCategoryId('1');
        selectedCategory.value = '1';
        break;
      case 'Clothes':
        // setCategoryId('2');
        selectedCategory.value = '2';

        break;
      case 'Cosmetics':
        // setCategoryId('3');
        selectedCategory.value = '3';

        break;
      case 'Tools':
        // setCategoryId('4');
        selectedCategory.value = '4';

        break;

      case 'Electricity':
        // setCategoryId('5');
        selectedCategory.value = '5';

        break;
      case 'Electronics':
        // setCategoryId('6');
        selectedCategory.value = '6';

        break;
      case 'Furniture':
        // setCategoryId('7');
        selectedCategory.value = '7';

        break;
      case 'Jewelry':
        // setCategoryId('8');
        selectedCategory.value = '8';

        break;
      case 'Shoes':
        // setCategoryId('9');
        selectedCategory.value = '9';

        break;

      default:
        selectedCategory.value = '1';

      // setCategoryId('1');

      //Default sortin option, the fist of the list of options: Name
    }
  }

  //!CAPTURE IMAGES
  void captureImages(ImageSource source) async {
    try {
      imageUploading.value = true;

      final image =
          await ImagePicker().pickImage(source: source, imageQuality: 70);
      if (image != null) {
        previewImages.add(image.path);
        xfileList.add(image);

        if (selectedProductImage.value.isEmpty) {
          selectedProductImage.value = image.path;
        }

        JLoaders.successSnackBar(
            title: 'Image added', message: 'Upload succesfull');
        imageUploading.value = false;
      }
    } catch (e) {
      JLoaders.errorSnackBar(
          title: 'Oh Snap!', message: 'Something went wrong');
    }
  }
  //!DELETE IMAGES FROM LIST

  void deleteImagesFromList() {
    try {
      if (previewImages.isNotEmpty) {
        previewImages.remove(selectedProductImage.value);
        JLoaders.successSnackBar(title: 'Added image', message: 'Deleted');
        previewImages.isEmpty;
      }
    } catch (e) {
      JLoaders.errorSnackBar(title: 'No Image!', message: 'Added any image');
    }
  }
  //!DELETE WARNING

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(JSizes.md),
        title: 'Delete this image',
        middleText: 'Are you sure want to delete this image?',
        confirm: ElevatedButton(
          onPressed: () async {
            deleteImagesFromList();
            Navigator.of(Get.overlayContext!).pop();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: JSizes.lg),
            child: Text('Delete'),
          ),
        ),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('cancel')));
  }
  //!CLEAR ALL DATA

  void clearData() {
    salePrice.clear();
    discountPrice.clear();
    availableStock.clear();
    productBrand.clear();
    productName.clear();
    productDescription.clear();
    selectedProductImage.value = '';
    previewImages.clear();
  }
  //!UPLOAD PRODUCTS

  Future<void> uploadProducts() async {
    try {
      //start loading animation
      JFullScreenLoader.openLoadingDialog(
          'Uploading product', JImages.uploadingImages);

      //check internet conectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        JFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!newProductFormKey.currentState!.validate()) {
        JFullScreenLoader.stopLoading();
        return;
      }

      //upload to fire store and get url links
      final imageUrlList =
          await firestore.uploadImageList('Users/Images/Profile', xfileList);

      //upload the information
      await productRepository.uploadProduct(ProductModel(
          categoryId: selectedCategory.value,
          images: imageUrlList,
          id: AuthenticationRepository.instance.authUser.uid,
          stock: int.tryParse(availableStock.text)!,
          salePrice: double.tryParse(salePrice.text)!,
          price: double.tryParse(discountPrice.text) ?? 0,
          title: productName.text,
          description: productDescription.text,
          thumbnail: imageUrlList[0],
          productType: 'single',
          isFeatured: true,
          brand: BrandModel(
            isFeatured: true,
            productsCount: int.tryParse(availableStock.text)!,
            id: userInfoInsta.user.value.id,
            name: userInfoInsta.user.value.fullName,
            image: userInfoInsta.user.value.profilePicture,
          )));

      //remove loader

      JFullScreenLoader.stopLoading();

      //show succes message
      JLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your Product has been uploaded');

      clearData();

      //redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      JFullScreenLoader.stopLoading();
      JLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}