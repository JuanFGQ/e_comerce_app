import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app/data/services/firebase_storage/firebase_storage_service.dart';
import 'package:e_comerce_app/features/shop/models/baner_model.dart';
import 'package:e_comerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:e_comerce_app/utils/exceptions/format_exception.dart';
import 'package:e_comerce_app/utils/exceptions/platform_exception.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  //Get all order related to current user

  Future<List<BannerModel>> fetchBanners() async {
    try {
      //43
      //set here the collection i would like to get
      final result = await _db
          .collection('Banners')
          .where('active', isEqualTo: true)
          .get();
      return result.docs
          .map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw JFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw JFormatException();
    } on PlatformException catch (e) {
      throw JPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again';
    }
  }

  // Upload Banners to the Cloud Firebase

  Future<void> uploadBannersDummyData(List<BannerModel> banners) async {
    try {
      //upload all the categories along with their Images
      final storage = Get.put(JFirebaseStorageService());

      //loop through each category

      for (var banners in banners) {
        //Get image data Link from the local assets
        final file = await storage.getImageDataFrommAssets(banners.imageUrl);

        //upload image and get its url
        final url =
            await storage.uploadImageData('Banners', file, banners.imageUrl);

        //assing Url to category.image attribute
        banners.imageUrl = url;

        //store category in firestore
        await _db.collection("Banners").doc().set(banners.toJson());
      }
    } on FirebaseException catch (e) {
      throw JFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw JFormatException();
    } on PlatformException catch (e) {
      throw JPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again';
    }
  }
}
