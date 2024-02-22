import 'package:get/get.dart';

class NewProductController extends GetxController {
  static NewProductController get instance => Get.find();

  RxString assingCategory = 'Animals'.obs;

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
}
