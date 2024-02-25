import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app/data/services/firebase_storage/firebase_storage_service.dart';
import 'package:e_comerce_app/features/shop/models/brand_model.dart';
import 'package:e_comerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:e_comerce_app/utils/exceptions/format_exception.dart';
import 'package:e_comerce_app/utils/exceptions/platform_exception.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  //variables

  final _db = FirebaseFirestore.instance;

  //get all categories
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snaphot = await _db.collection('Brands').get();
      final result =
          snaphot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();

      return result;
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

//Get brand for categories
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      //Query to get all documents where categoryId matches the provided categoryId
      QuerySnapshot brandCategoryQuery = await _db
          .collection('BrandCategory')
          .where('categoryId', isEqualTo: categoryId)
          .get();

      //Extract brandIds from the documents
      List<String> brandIds =
          brandCategoryQuery.docs.map((e) => e['brandId'] as String).toList();

      //Query to get all documents where the brandId is the List of brandIds, FieldPath.coumentId to query documents in Collection
      final brandsQuery = await _db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();

      //Extract  brand names or other relevant data from the documents
      List<BrandModel> brands =
          brandsQuery.docs.map((e) => BrandModel.fromSnapshot(e)).toList();

      return brands;
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

//Upload dummy data
  Future<void> uploadDummyData(List<BrandModel> brands) async {
    try {
      //upload all the categories along with their Images
      final storage = Get.put(TFirebaseStorageService());

      //loop through each category

      for (var brand in brands) {
        //Get image data Link from the local assets
        final file = await storage.getImageDataFrommAssets(brand.image);

        //upload image and get its url
        final url = await storage.uploadImageData('Brand', file, brand.image);

        //assing Url to category.image attribute
        brand.image = url;

        //store category in firestore
        await _db.collection("Brands").doc(brand.id).set(brand.toJson());
      }
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
