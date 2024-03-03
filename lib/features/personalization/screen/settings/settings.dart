import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_comerce_app/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:e_comerce_app/common/widgets/list_tiles/user_list_tile.dart';
import 'package:e_comerce_app/common/widgets/text/section_header.dart';
import 'package:e_comerce_app/data/repositories/autentication/authentication_repository.dart';
import 'package:e_comerce_app/data/repositories/banners/banner_repository.dart';
import 'package:e_comerce_app/data/repositories/categories/category_repository.dart';
import 'package:e_comerce_app/dummy_data.dart';
import 'package:e_comerce_app/features/personalization/screen/address/address.dart';
import 'package:e_comerce_app/features/personalization/screen/profile/profile.dart';
import 'package:e_comerce_app/features/shop/controllers/banner_controller.dart';
import 'package:e_comerce_app/features/shop/controllers/product/brand_controller.dart';
import 'package:e_comerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:e_comerce_app/features/shop/screens/screens/cart/cart.dart';
import 'package:e_comerce_app/features/shop/screens/screens/order/orders.dart';
import 'package:e_comerce_app/utils/constants/colors.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AuthenticationRepository.instance;
    final uploadData = CategoryRepository.instance;
    final uploadBanner = BannerController.instance;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///HEADER
            JPrimaryHeaderContainer(
                child: Column(
              children: [
                JAppBar(
                    title: Text(
                  'Account',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .apply(color: JColors.white),
                )),
                const SizedBox(height: JSizes.spaceBtwSection),

                //USER PROFILE SETTINGS
                JUserProfileTile(
                  onPressed: () => Get.to(() => const ProfileScreen()),
                ),
                const SizedBox(height: JSizes.spaceBtwSection)
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(JSizes.defaultSpace),
              child: Column(
                children: [
                  const JSectionHeading(
                      title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: JSizes.spaceBtwSection),
                  JSettingMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Address',
                      subTitle: 'Set shopping delivery adress',
                      onTap: () => Get.to(() => const UserAddressScreen())),
                  JSettingMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subTitle: 'Add, remove products and move to checkout',
                      onTap: () => Get.to(() => const CartScreen())),
                  JSettingMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subTitle: 'In-progres and Completed Orders',
                      onTap: () => Get.to(() => const OrderScreen())),
                  JSettingMenuTile(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subTitle: 'Withdraw balance to registered bank account',
                      onTap: () {}),
                  JSettingMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subTitle: 'List of all the descounted coupons',
                      onTap: () {}),
                  JSettingMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subTitle: 'Set any kind of notifications message',
                      onTap: () {}),
                  JSettingMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subTitle: 'Manage data usage and connected accounts',
                      onTap: () {}),

                  //APP SETTING
                  const SizedBox(height: JSizes.spaceBtwSection),
                  const JSectionHeading(
                      title: 'App Settings', showActionButton: false),
                  const SizedBox(height: JSizes.spaceBtwItems),
                  //!UPLOAD DATA
                  //!----------------------CATEGORIES-------------------------
                  JSettingMenuTile(
                      onTap: () => uploadData.uploadDummyData(
                            JDummyData.categories,
                          ),
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subTitle: 'Upload Data to your Cloud Firestorage '),
                  //!-----------------------BANNERS------------------------
                  JSettingMenuTile(
                      onTap: () => uploadBanner.uploadBanners(),
                      icon: Iconsax.document_upload1,
                      title: 'Upload Banners Data',
                      subTitle: 'Upload Data to your Cloud Firestorage '),
                  //!----------------------BRANDS-------------------------

                  JSettingMenuTile(
                      onTap: () =>
                          Get.put(BrandController()).uploadBrandDummyData(),
                      icon: Iconsax.document,
                      title: 'Upload Brands Data',
                      subTitle: 'Upload Data to your Cloud Firestorage '),

                  //!----------------------PRODUCTS-------------------------

                  JSettingMenuTile(
                      onTap: () => ProductController.instance.uploadDummyData(),
                      icon: Iconsax.document,
                      title: 'Upload Products Data',
                      subTitle: 'Upload Data to your Cloud Firestorage '),
                  //!-----------------------------------------------
                  JSettingMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recomendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  JSettingMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  JSettingMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  ///LOG OUT BUTTON
                  const SizedBox(height: JSizes.spaceBtwSection),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () => controller.logOut(),
                        child: const Text('Logout')),
                  ),
                  const SizedBox(height: JSizes.spaceBtwSection * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
