import 'package:e_comerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_comerce_app/common/widgets/succes%20screen/success_screen.dart';
import 'package:e_comerce_app/data/repositories/autentication/authentication_repository.dart';
import 'package:e_comerce_app/data/repositories/orders/order_repository.dart';
import 'package:e_comerce_app/features/personalization/controller/address_controller.dart';
import 'package:e_comerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:e_comerce_app/features/shop/controllers/product/checkout_controller.dart';
import 'package:e_comerce_app/features/shop/models/order_model.dart';
import 'package:e_comerce_app/navigation_menu.dart';
import 'package:e_comerce_app/utils/constants/enums.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  //variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckOutController.instance;
  final orderRepository = Get.put(OrderRepository());

  // fetch user`s order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      JLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  //Add methods for order processing

  void processOrder(double totalAmount) async {
    try {
      //Start Loader
      JFullScreenLoader.openLoadingDialog(
          'Processing your order', JImages.paymentSuccess);

      //Get user authentication Id

      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty) return;

      //Add details
      final order = OrderModel(
          //Generate a unique ID for the order
          id: UniqueKey().toString(),
          userId: userId,
          status: OrderStatus.pending,
          totalAmount: totalAmount,
          orderDate: DateTime.now(),
          items: cartController.cartItems.toList(),
          //set date as needed
          deliveryDate: DateTime.now(),
          paymentMethod: checkoutController.selectedPaymenthMethod.value.name,
          address: addressController.selectedAddress.value);

      //save the order to fireStore
      await orderRepository.saveOrder(order, userId);

      //update de cart status
      cartController.clearCart();

      //show success screen
      Get.off(() => SuccesScreen(
            image: JImages.paymentSuccess,
            title: 'Payment Success',
            subTitle: 'Your Item will be shipped soon',
            onPressed: () => Get.offAll(() => const NavigationMenu()),
          ));
    } catch (e) {
      JLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
