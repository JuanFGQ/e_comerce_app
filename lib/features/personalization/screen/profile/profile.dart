import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/common/widgets/images/circular_images.dart';
import 'package:e_comerce_app/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:e_comerce_app/common/widgets/text/section_header.dart';
import 'package:e_comerce_app/features/personalization/controller/user_controller.dart';
import 'package:e_comerce_app/features/personalization/screen/profile/widgets/change_name.dart';
import 'package:e_comerce_app/features/personalization/screen/profile/widgets/profile_menu_tile.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
        appBar: const TAppBar(
          showBackArrow: true,
          title: Text('Profile'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                //*profilePicture
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Obx(() {
                        final networkImage =
                            controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : TImages.darkAppLogo;

                        return controller.imageUploading.value
                            ? const TShimmerEffect(
                                width: 80, height: 80, raidus: 80)
                            : TCircularImage(
                                isNetWorkImage: networkImage.isNotEmpty,
                                image: image,
                                width: 80,
                                height: 80);
                      }),
                      TextButton(
                          onPressed: () => controller.uploadProfilePicture(),
                          child: const Text('Change Profile Picture'))
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                //*HEADING PERSONAL INFO
                const TSectionHeading(
                    title: 'Profile Information', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),

                //USER PROFILE TILES
                TProfileMenuTile(
                    onPressed: () => Get.to(() => const ChangeNameScreen()),
                    title: 'Name',
                    value: controller.user.value.fullName),

                TProfileMenuTile(
                    onPressed: () {},
                    title: 'Username',
                    value: controller.user.value.username),

                const Divider(),

                //PERSONAL INFORMATION

                TProfileMenuTile(
                    onPressed: () {},
                    title: 'User ID',
                    value: controller.user.value.id),

                TProfileMenuTile(
                    onPressed: () {},
                    title: 'E-mail',
                    value: controller.user.value.email),

                TProfileMenuTile(
                    onPressed: () {},
                    title: 'Phone Number',
                    value: controller.user.value.phoneNumber),

                TProfileMenuTile(
                    onPressed: () {}, title: 'Gender', value: 'Male'),

                TProfileMenuTile(
                    onPressed: () {},
                    title: 'Date of Birth',
                    value: '10 Oct,1994'),

                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                Center(
                  child: TextButton(
                      onPressed: () => controller.deleteAccountWarningPopup(),
                      child: const Text('Close Accouont',
                          style: TextStyle(color: Colors.red))),
                )
              ],
            ),
          ),
        ));
  }
}
