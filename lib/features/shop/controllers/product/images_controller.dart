import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_comerce_app/features/shop/models/poduct_model.dart';
import 'package:e_comerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

//VARIABLES
  RxString selectedProductImage = ''.obs;

  ///get all images from product and variations
  List<String> getAllProductImages(ProductModel product) {
    //use set to add unique images only
    Set<String> images = {};

    //load thumbnail image
    images.add(product.thumbnail);

    //Assign Thumbnail as Selected Image
    selectedProductImage.value = product.thumbnail;

    //Get all images from the product model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }
    //Get all images from product Variatiosn if not null
    if (product.productVariatiosn != null ||
        product.productVariatiosn!.isNotEmpty) {
      images.addAll(
          product.productVariatiosn!.map((variation) => variation.image));
    }
    return images.toList();
  }

  // Show Image Popup

  void showEnlargedImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: TSizes.defaultSpace * 2,
                        horizontal: TSizes.defaultSpace),
                    child: CachedNetworkImage(imageUrl: image),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSection),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        width: 150,
                        child: OutlinedButton(
                            onPressed: () => Get.back(),
                            child: const Text('Close'))),
                  )
                ],
              ),
            ));
  }
}