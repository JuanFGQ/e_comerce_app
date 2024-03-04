import 'package:e_comerce_app/features/authentication/controllers/network/network_manager.dart';
import 'package:e_comerce_app/features/personalization/controller/address_controller.dart';
import 'package:e_comerce_app/features/personalization/controller/user_controller.dart';
import 'package:e_comerce_app/features/shop/controllers/product/checkout_controller.dart';
import 'package:e_comerce_app/features/shop/controllers/product/favourite_controller.dart';
import 'package:e_comerce_app/features/shop/controllers/product/variation_controller.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckOutController());
    Get.put(FavouriteController());
    Get.put(UserController());
  }
}
