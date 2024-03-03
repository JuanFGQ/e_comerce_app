import 'package:e_comerce_app/features/personalization/screen/settings/settings.dart';
import 'package:e_comerce_app/features/shop/controllers/product/new_product_controller.dart';
import 'package:e_comerce_app/features/shop/models/product_model.dart';
import 'package:e_comerce_app/features/shop/screens/screens/home/home.dart';
import 'package:e_comerce_app/features/shop/screens/screens/new_product/new_product.dart';
import 'package:e_comerce_app/features/shop/screens/screens/store/store.dart';
import 'package:e_comerce_app/features/shop/screens/screens/wishlist/wish_list.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunction.isDarkMode(context);
    final controller = Get.put(NavigationController());
    final newProductController = Get.put(NewProductController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            backgroundColor: dark ? JColors.black : JColors.white,
            indicatorColor: dark
                ? JColors.white.withOpacity(0.1)
                : JColors.black.withOpacity(0.1),
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) {
              controller.selectedIndex.value = index;
              if (index != 2) {
                newProductController.clearData();
              }
            },
            height: 80,
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.note), label: 'Home'),
              NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
              NavigationDestination(
                  icon: Icon(Iconsax.heart), label: 'WishList'),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomePage(),
    const StoreScreen(),
    const FavouriteScreen(),
    const SettingsScreen()
  ];
}
