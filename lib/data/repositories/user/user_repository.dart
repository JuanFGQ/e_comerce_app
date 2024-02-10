
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app/features/authentication/models/user/user_model.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Function to save user data to FireStore

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db
          .collection("Users")
          .doc(user.id)
          .set(user.toJson()); // } on FirebaseException catch (e) {
      //   throw TFirebaseException(e.code).message;
      // throw 'Something went wrong. please try again';

      // } on FormatException catch (_) {
      //   throw const TFormatException();
      // } on PlatformException catch (e) {
      //   throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again';
    }
  }
}
