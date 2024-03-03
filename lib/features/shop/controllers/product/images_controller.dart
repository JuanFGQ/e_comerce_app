import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_comerce_app/features/shop/models/product_model.dart';
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
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
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
                        vertical: JSizes.defaultSpace * 2,
                        horizontal: JSizes.defaultSpace),
                    child: CachedNetworkImage(imageUrl: image),
                  ),
                  const SizedBox(height: JSizes.spaceBtwSection),
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
