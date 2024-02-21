import 'package:get/get.dart';

class NewProductController extends GetxController {
  static NewProductController get instance => Get.find();

  RxString assingCategory = 'shoes'.obs;

  void sortProducts(String sortOption) {
    assingCategory.value = sortOption;

    switch (sortOption) {
      case 'Name':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Higher Price':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Lower Price':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Newest':
        products.sort((a, b) => a.date!.compareTo(b.date!));
        break;

      case 'Sale':
        products.sort((a, b) {
          if (b.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice > 0) {
            return -1;
          } else {
            return 1;
          }
        });

        break;

      default:
        //Default sortin option, the fist of the list of options: Name
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }
}
