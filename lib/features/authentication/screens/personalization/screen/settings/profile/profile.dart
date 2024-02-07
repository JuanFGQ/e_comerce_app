import 'package:e_comerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_comerce_app/common/widgets/images/circular_images.dart';
import 'package:e_comerce_app/common/widgets/text/section_header.dart';
import 'package:e_comerce_app/features/authentication/screens/personalization/screen/settings/profile/widgets/profile_menu_tile.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text('Profile'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                //*profilePicture
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      TCircularImage(
                          image: TImages.facebook, width: 80, height: 80),
                      TextButton(
                          onPressed: () {},
                          child: Text('Change Profile Picture'))
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
                    onPressed: () {}, title: 'User ID', value: '23122'),

                TProfileMenuTile(
                    onPressed: () {},
                    title: 'E-mail',
                    value: 'juanito123@gmail.com'),

                TProfileMenuTile(
                    onPressed: () {},
                    title: 'Phone Number',
                    value: '+92-317-8059528'),

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
                      onPressed: () {},
                      child: Text('Close Accouont',
                          style: TextStyle(color: Colors.red))),
                )
              ],
            ),
          ),
        ));
  }
}
