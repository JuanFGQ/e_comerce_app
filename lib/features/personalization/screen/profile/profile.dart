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
        appBar: const JAppBar(
          showBackArrow: true,
          title: Text('Profile'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(JSizes.defaultSpace),
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
                            : JImages.darkAppLogo;

                        return controller.imageUploading.value
                            ? const JShimmerEffect(
                                width: 80, height: 80, raidus: 80)
                            : JCircularImage(
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
                const SizedBox(height: JSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: JSizes.spaceBtwItems),

                //*HEADING PERSONAL INFO
                const JSectionHeading(
                    title: 'Profile Information', showActionButton: false),
                const SizedBox(height: JSizes.spaceBtwItems),

                //USER PROFILE TILES
                JProfileMenuTile(
                    onPressed: () => Get.to(() => const ChangeNameScreen()),
                    title: 'Name',
                    value: controller.user.value.fullName),

                JProfileMenuTile(
                    onPressed: () {},
                    title: 'Username',
                    value: controller.user.value.username),

                const Divider(),

                //PERSONAL INFORMATION

                JProfileMenuTile(
                    onPressed: () {},
                    title: 'User ID',
                    value: controller.user.value.id),

                JProfileMenuTile(
                    onPressed: () {},
                    title: 'E-mail',
                    value: controller.user.value.email),

                JProfileMenuTile(
                    onPressed: () {},
                    title: 'Phone Number',
                    value: controller.user.value.phoneNumber),

                JProfileMenuTile(
                    onPressed: () {}, title: 'Gender', value: 'Male'),

                JProfileMenuTile(
                    onPressed: () {},
                    title: 'Date of Birth',
                    value: '10 Oct,1994'),

                const Divider(),
                const SizedBox(height: JSizes.spaceBtwItems),

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
