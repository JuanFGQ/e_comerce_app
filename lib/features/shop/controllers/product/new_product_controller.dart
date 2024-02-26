import 'package:e_comerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_comerce_app/data/repositories/autentication/authentication_repository.dart';
import 'package:e_comerce_app/data/repositories/products/products_repository.dart';
import 'package:e_comerce_app/features/authentication/controllers/network/network_manager.dart';
import 'package:e_comerce_app/features/shop/models/brand_model.dart';
import 'package:e_comerce_app/features/shop/models/poduct_model.dart';
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
      final image =
          await ImagePicker().pickImage(source: source, imageQuality: 70);
      if (image != null) {
        imageUploading.value = true;

        previewImages.add(image.path);
        xfileList.add(image);

        if (selectedProductImage.value.isEmpty) {
          selectedProductImage.value = image.path;
        }
        imageUploading.value = false;

        TLoaders.successSnackBar(
            title: 'Image added', message: 'Upload succesfull');
      }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Oh Snap!', message: 'Something went wrong');
    }
  }
  //!DELETE IMAGES FROM LIST

  void deleteImagesFromList() {
    try {
      if (previewImages.isNotEmpty) {
        previewImages.remove(selectedProductImage.value);
        TLoaders.successSnackBar(title: 'Added image', message: 'Deleted');
        previewImages.isEmpty;
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'No Image!', message: 'Added any image');
    }
  }
  //!DELETE WARNING

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
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
            padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
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
      TFullScreenLoader.openLoadingDialog(
          'Uploading product', TImages.uploadingImages);

      //check internet conectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!newProductFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
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
          price: double.tryParse(salePrice.text)!,
          salePrice: double.tryParse(discountPrice.text) ?? 0,
          title: productName.text,
          description: productDescription.text,
          thumbnail: imageUrlList[0],
          productType: 'single',
          isFeatured: true,
          brand: BrandModel(
              isFeatured: true,
              productsCount: int.tryParse(availableStock.text)!,
              id: AuthenticationRepository.instance.authUser.uid,
              name: AuthenticationRepository.instance.authUser.displayName!,
              image: AuthenticationRepository.instance.authUser.photoURL!)));

      //remove loader

      TFullScreenLoader.stopLoading();

      //show succes message
      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your Name has been updated');

      clearData();

      //redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
