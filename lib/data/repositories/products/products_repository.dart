import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app/data/repositories/autentication/authentication_repository.dart';
import 'package:e_comerce_app/data/services/firebase_storage/firebase_storage_service.dart';
import 'package:e_comerce_app/features/shop/models/product_model.dart';
import 'package:e_comerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:e_comerce_app/utils/exceptions/format_exception.dart';
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
          .where('isFeatured', isEqualTo: true)
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

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('isFeatured', isEqualTo: true)
          .limit(6)
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

  //!GET PRODUCTS BASED ON THE BRAND
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((e) => ProductModel.fromQuerySnapshot(e))
          .toList();

      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Pleae try again';
    }
  }

  Future<List<ProductModel>> getFavoritesProducts(
      List<String> productsIds) async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productsIds)
          .get();

      return snapshot.docs
          .map((quuerySnapshot) => ProductModel.fromSnapshot(quuerySnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Pleae try again';
    }
  }

  //!upload test data to the cloud firebase

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
        //!Upload Variation Images

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

//get the brand information by the brand id based on productModel
  Future<List<ProductModel>> getProductsForBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection('Products')
              .where('BrandId', isEqualTo: brandId)
              .get()
          : await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .limit(limit)
              .get();

      final products =
          querySnapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Pleae try again';
    }
  }

  Future<List<ProductModel>> getProductsForCategory(
      {required String categoryId, int limit = -1}) async {
    try {
      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db
              .collection('ProductsCategory')
              .where('categoryId', isEqualTo: categoryId)
              .get()
          : await _db
              .collection('ProductsCategory')
              .where('categoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();

      //Exract productsIds from the documents
      List<String> productsIds = productCategoryQuery.docs
          .map((e) => e['productsId'] as String)
          .toList();

      //Query to get all documents where the brandId is in the list of brandsId , FilePath.documentId to query documents in Collection
      final productsQuery = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productsIds)
          .get();

      //Extract brand names or other relevant data from the documents
      List<ProductModel> products =
          productsQuery.docs.map((e) => ProductModel.fromSnapshot(e)).toList();

      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Pleae try again';
    }
  }

  Future<void> uploadProduct(ProductModel model) async {
    try {
      await _db.collection("Products").doc().set(model.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again';
    }
  }
}
