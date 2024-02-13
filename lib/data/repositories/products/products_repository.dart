import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app/data/services/firebase_storage/firebase_storage_service.dart';
import 'package:e_comerce_app/features/shop/models/poduct_model.dart';
import 'package:e_comerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:e_comerce_app/utils/exceptions/platform_exception.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  //fireStore instance for dataBase interactions
  final _db = FirebaseFirestore.instance;

  //get limited features Products

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      //return the snapshot document of the products
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Pleae try again';
    }
  }

  //upload test data to the cloud firebase

  //**WARNING
  //this could be optional due to this method is used to upload test data or dummy data whatever
  Future<void> uploadTestData(List<ProductModel> products) async {
    try {
      //Upload all the products along with theis images
      final storage = Get.put(TFirebaseStorageService());

      //loop through each product
      for (var product in products) {
        //Get image data link from local assets
        final thumbnail =
            await storage.getImageDataFrommAssets(product.thumbnail);

        //upload image and get its URL
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        //Assign URL to product.thumbnail attribute
        product.thumbnail = url;

        //Product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imageUrl = [];
          for (var image in product.images!) {
            //Get image dat alink from local assets
            final assetImage = await storage.getImageDataFrommAssets(image);

            //upload image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);

            //assign URL to product.thumbnail attribute
            imageUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imageUrl);
        }
        //**Upload Variation Images

        // if (product.productType == ProductType.variable.toString()) {
        //   for (var variation in product.productVariatiosn!) {
        //     //Get image data link from local assets
        //     final assetImage =
        //         await storage.getImageDataFrommAssets(variation.image);

        //     //Upload image and get its URL
        //     final url = await storage.uploadImageData(
        //         'Products/Images', assetImage, variation.image);

        //     //Assign URL to variation image attribute
        //     variation.image = url;
        //   }
        // }

        //Store product in Firestore
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
