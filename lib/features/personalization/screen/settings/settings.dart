import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_comerce_app/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:e_comerce_app/common/widgets/list_tiles/user_list_tile.dart';
import 'package:e_comerce_app/common/widgets/text/section_header.dart';
import 'package:e_comerce_app/data/repositories/authentication_repository.dart';
import 'package:e_comerce_app/features/personalization/screen/address/address.dart';
import 'package:e_comerce_app/features/personalization/screen/profile/profile.dart';
import 'package:e_comerce_app/features/screens/shop/screens/cart/cart.dart';
import 'package:e_comerce_app/features/screens/shop/screens/order/orders.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///HEADER
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                TAppBar(
                    title: Text(
                  'Account',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .apply(color: TColors.white),
                )),
                const SizedBox(height: TSizes.spaceBtwSection),

                //USER PROFILE SETTINGS
                TUserProfileTile(
                  onPressed: () => Get.to(() => const ProfileScreen()),
                ),
                const SizedBox(height: TSizes.spaceBtwSection)
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(
                      title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwSection),
                  TSettingMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Address',
                      subTitle: 'Set shopping delivery adress',
                      onTap: () => Get.to(() => const UserAddressScreen())),
                  TSettingMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subTitle: 'Add, remove products and move to checkout',
                      onTap: () => Get.to(() => const CartScreen())),
                  TSettingMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subTitle: 'In-progres and Completed Orders',
                      onTap: () => Get.to(() => const OrderScreen())),
                  TSettingMenuTile(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subTitle: 'Withdraw balance to registered bank account',
                      onTap: () {}),
                  TSettingMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subTitle: 'List of all the descounted coupons',
                      onTap: () {}),
                  TSettingMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subTitle: 'Set any kind of notifications message',
                      onTap: () {}),
                  TSettingMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subTitle: 'Manage data usage and connected accounts',
                      onTap: () {}),

                  //APP SETTING
                  const SizedBox(height: TSizes.spaceBtwSection),
                  const TSectionHeading(
                      title: 'App Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TSettingMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subTitle: 'Upload Data to your Cloud Firestorage '),
                  TSettingMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recomendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  ///LOG OUT BUTTON
                  const SizedBox(height: TSizes.spaceBtwSection),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () => controller.logOut(),
                        child: const Text('Logout')),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSection * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
