import 'package:e_comerce_app/common/widgets/rounded_images/rounded_images.dart';
import 'package:e_comerce_app/features/shop/models/poduct_model.dart';
import 'package:e_comerce_app/features/shop/screens/screens/new_product/widgets/add_images_slider.dart';
import 'package:e_comerce_app/features/shop/screens/screens/prouct_details/widgets/product_detail_image_slider.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/constants/text_strings.dart';
import 'package:e_comerce_app/utils/validators/validators.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

class NewProductScreen extends StatelessWidget {
  const NewProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //MAIN PRODUCT IMAGES

            JAddImagesSlider(),

            //PRICE SETTER

            Row(
              children: [
                //SALE PRICE
                SizedBox(width: TSizes.defaultSpace / 2),
                Expanded(
                  child: TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: 'Sale Price',
                          prefixIcon: Icon(Iconsax.money_3))),
                ),
                SizedBox(width: TSizes.spaceBtwSection / 2),

                Expanded(
                  child: TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: 'Discount Price',
                          prefixIcon: Icon(Iconsax.discount_circle))),
                ),
                const SizedBox(width: TSizes.defaultSpace / 2),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSection),

            //PRODUCT NAME
            Padding(
              padding: const EdgeInsets.only(
                  left: TSizes.defaultSpace, right: TSizes.defaultSpace),
              child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: 'Product Name',
                      prefixIcon: Icon(Iconsax.additem4))),
            ),
            const SizedBox(height: TSizes.spaceBtwSection),

            //AVAILABLE STOCK
            Row(
              children: [
                SizedBox(width: TSizes.defaultSpace / 2),
                Expanded(
                  child: TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: 'Product Brand',
                          prefixIcon: Icon(Iconsax.airdrop5))),
                ),
                SizedBox(width: TSizes.spaceBtwSection / 2),
                Expanded(
                  child: TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: 'Available Stock',
                          prefixIcon: Icon(Iconsax.computing))),
                ),
                SizedBox(width: TSizes.defaultSpace / 2),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSection),

            //DESCRIPTION
            Padding(
              padding: const EdgeInsets.only(
                  left: TSizes.defaultSpace, right: TSizes.defaultSpace),
              child: Expanded(
                child: TextFormField(
                    // minLines: 0,
                    // maxLines: 5,
                    // expands: true,
                    decoration: const InputDecoration(
                        labelText: 'Describe your product',
                        prefixIcon: Icon(Iconsax.additem4))),
              ),
            ),

            //SELECT CATEGORY
          ],
        ),
      ),
    );
  }
}
