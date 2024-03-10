import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app/data/repositories/autentication/authentication_repository.dart';
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

  Stream<List<MessageModel>> getUsersStream() {
    try {
      final userId = _auth.currentUser!.uid;
      return _db
          .collection("Users")
          .doc(userId)
          .collection('messsages')
          .snapshots()
          .map((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          return snapshot.docs
              .map((doc) => MessageModel.fromSnapshot(doc))
              .toList();
        } else {
          return [];
        }
      });
    } on FirebaseException catch (e) {
      throw JFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw JPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Pleae try again';
    }
  }

  //!SEND MESSAGES
  Future<void> sendMessages(MessageModel newMessage, String chatRoomID) async {
    try {
      await _db
          .collection("Chat_Rooms")
          .doc(chatRoomID)
          .collection('messages')
          .add(newMessage.toJson());
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

  //!FETCH MESSAGES

  Stream<QuerySnapshot> fetchMessages(String chatRoomID) {
    try {
      final snapshot = _db
          .collection("Chat_Rooms")
          .doc(chatRoomID)
          .collection('messages')
          .orderBy("timeStamp", descending: false)
          .snapshots();
      return snapshot;
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

  //!STORE CHAT ROOMS

  Future<void> storeChatRoom({required String otherUserID}) async {
    try {
      final userId = _auth.currentUser!.uid;

      final chatRoomID = '${userId}_$otherUserID';

      //check if the chatRoom already exists

      final existingChatRoom = await _db
          .collection('Users')
          .doc(userId)
          .collection('chat_rooms')
          .where('chatRoomID', isEqualTo: chatRoomID)
          .get();

//document with the same chatRoom ID doesn´t exists, create a new one
      if (existingChatRoom.docs.isEmpty) {
        await _db
            .collection('Users')
            .doc(userId)
            .collection('chat:_rooms')
            .add({'chatRoomID': chatRoomID});
      } else {
        return;
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

  //!GET CHATROOMS FOR CURRENT USER

  Future<QuerySnapshot<Map<String, dynamic>>> getChatRoomID(
      {required String userID}) async {
    try {
      final chatRoomID = await _db
          .collection('Users')
          .doc(userID)
          .collection('chat_rooms')
          .get();

      print('GET CHAT ROOM ID $chatRoomID');
      return chatRoomID;
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

  //!GET NON READ MESSAGES

  Stream<QuerySnapshot> fetchLastMessage({required String chatRoomID}) {
    try {
      final snapshot = _db
          .collection("Chat_Rooms")
          .doc(chatRoomID)
          .collection('messages')
          .orderBy("timeStamp", descending: true)
          .limit(1)
          .snapshots();

      print('FETCH NON READED MESSAGES  $snapshot');

      return snapshot;
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
