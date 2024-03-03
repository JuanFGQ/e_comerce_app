import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app/data/repositories/autentication/authentication_repository.dart';
import 'package:e_comerce_app/features/authentication/models/user/user_model.dart';
import 'package:e_comerce_app/features/messages/model/message_model.dart';
import 'package:e_comerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:e_comerce_app/utils/exceptions/format_exception.dart';
import 'package:e_comerce_app/utils/exceptions/platform_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MessagingRepository extends GetxController {
  static MessagingRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  //!GET USER STREAM

  Stream<List<UserModel>> getUsersStream() {
    try {
      return _db.collection("Users").snapshots().map((snapshot) {
        return snapshot.docs.map((doc) => UserModel.fromSnapshot(doc)).toList();
      });
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Pleae try again';
    }
  }

  //!SEND MESSAGES
  Future<void> sendMessages(MessageModel newMessage, String chatRoomID) async {
    final userId = AuthenticationRepository.instance.authUser.uid;

    try {
      await _db
          .collection("Users")
          .doc(userId)
          .collection('messages')
          .doc(chatRoomID)
          .collection('message')
          .add(newMessage.toJson());
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

  //!FETCH MESSAGES

  Stream<List<MessageModel>> fetchMessages(String chatRoomID) {
    final userId = AuthenticationRepository.instance.authUser.uid;

    try {
      final snapshot = _db
          .collection("Users")
          .doc(userId)
          .collection('messages')
          .doc(chatRoomID)
          .collection('message')
          .orderBy("timeStamp", descending: false)
          .snapshots();

      return snapshot.map(
          (m) => m.docs.map((e) => MessageModel.fromQuerySnapshot(e)).toList());
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
