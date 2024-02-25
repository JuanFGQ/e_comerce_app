import 'package:e_comerce_app/common/widgets/rounded_images/rounded_images.dart';
import 'package:e_comerce_app/common/widgets/selected_category/select_category.dart';
import 'package:e_comerce_app/features/shop/controllers/product/new_product_controller.dart';
import 'package:e_comerce_app/features/shop/models/poduct_model.dart';
import 'package:e_comerce_app/features/shop/screens/screens/new_product/widgets/add_images_slider.dart';
import 'package:e_comerce_app/features/shop/screens/screens/prouct_details/widgets/product_detail_image_slider.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:e_comerce_app/utils/constants/text_strings.dart';
import 'package:e_comerce_app/utils/validators/validators.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

class NewProductScreen extends StatelessWidget {
  const NewProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewProductController());
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        controller.clearData();
        return;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //!MAIN PRODUCT IMAGES

              const JAddImagesSlider(),

              //!PRICE SETTER

              Row(
                children: [
                  //!SALE PRICE
                  const SizedBox(width: TSizes.defaultSpace / 2),
                  Expanded(
                    child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: controller.salePrice,
                        validator: (value) =>
                            TValidator.validateEmptyText('sale price', value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: 'Sale Price',
                            prefixIcon: Icon(Iconsax.money_3))),
                  ),
                  const SizedBox(width: TSizes.spaceBtwSection / 2),
                  //!DISCOUNT PRICE
                  Expanded(
                    child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: controller.discountPrice,
                        validator: (value) => TValidator.validateEmptyText(
                            'discount price', value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: 'Discount Price',
                            prefixIcon: Icon(Iconsax.discount_circle))),
                  ),
                  const SizedBox(width: TSizes.defaultSpace / 2),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSection),

              //!PRODUCT NAME
              Padding(
                padding: const EdgeInsets.only(
                    left: TSizes.defaultSpace, right: TSizes.defaultSpace),
                child: TextFormField(
                    expands: false,
                    controller: controller.productName,
                    validator: (value) =>
                        TValidator.validateEmptyText('Product name', value),
                    decoration: const InputDecoration(
                        labelText: 'Product Name',
                        prefixIcon: Icon(Iconsax.additem4))),
              ),
              const SizedBox(height: TSizes.spaceBtwSection),

              //!PRODUCT BRAND
              Row(
                children: [
                  const SizedBox(width: TSizes.defaultSpace / 2),
                  Expanded(
                    child: TextFormField(
                        controller: controller.productBrand,
                        validator: (value) => TValidator.validateEmptyText(
                            'Product Brand', value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: 'Product Brand',
                            prefixIcon: Icon(Iconsax.airdrop5))),
                  ),
                  const SizedBox(width: TSizes.spaceBtwSection / 2),

                  //!AVAILABLE STOCK
                  Expanded(
                    child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: controller.availableStock,
                        validator: (value) => TValidator.validateEmptyText(
                            'Available Stock', value),
                        decoration: const InputDecoration(
                            labelText: 'Available Stock',
                            prefixIcon: Icon(Iconsax.computing))),
                  ),
                  const SizedBox(width: TSizes.defaultSpace / 2),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSection),

              //!DESCRIPTION
              Padding(
                padding: const EdgeInsets.only(
                    left: TSizes.defaultSpace, right: TSizes.defaultSpace),
                child: TextFormField(
                    controller: controller.productDescription,
                    validator: (value) => TValidator.validateEmptyText(
                        'Describe your product', value),
                    decoration: const InputDecoration(
                        labelText: 'Describe your product',
                        prefixIcon: Icon(Iconsax.additem4))),
              ),
              const SizedBox(height: TSizes.spaceBtwSection),

              //!SELECT CATEGORY
              const Padding(
                padding: EdgeInsets.only(
                    left: TSizes.defaultSpace, right: TSizes.defaultSpace),
                child: JSelectedCategory(),
              ),

              //!PUBLISH BUTTON
              Padding(
                padding: const EdgeInsets.only(
                    left: TSizes.defaultSpace, right: TSizes.defaultSpace),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.uploadProducts(),
                      // onPressed: () => ,
                      child: const Text('Publish')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
