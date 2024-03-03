import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_comerce_app/data/repositories/messages/messages_repository.dart';
import 'package:e_comerce_app/features/authentication/controllers/network/network_manager.dart';
import 'package:e_comerce_app/features/authentication/models/user/user_model.dart';
import 'package:e_comerce_app/features/messages/model/message_model.dart';
import 'package:e_comerce_app/features/shop/models/product_model.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class MessaggingController extends GetxController {
  static MessaggingController get instance => Get.find();

  RxList<UserModel> usersList = <UserModel>[].obs;
  //firebase auth instance
  final _auth = FirebaseAuth.instance;
  //firebase data base instance
  final _db = FirebaseFirestore.instance;
  //repositories
  final messageRepo = Get.put(MessagingRepository());
  //variables
  final messages = TextEditingController();
  //form validator
  GlobalKey<FormState> messagesForm = GlobalKey<FormState>();

  //!GET USERS LISTS

  Stream<List<MessageModel>> getUserMessage() {
    try {
      final user = messageRepo.getUsersStream();
      // usersList.assignAll(user as Iterable<UserModel>);
      return user;
    } catch (e) {
      return TLoaders.errorSnackBar(
          title: 'Error try later', message: e.toString());
    }
  }

  //! SEND MESSAGES
  Future sendMessages({required ProductModel productModel}) async {
    try {
      //check internet connectivity

      final isConneted = await NetworkManager.instance.isConnected();
      if (!isConneted) {
        return;
      }

      if (!messagesForm.currentState!.validate()) {
        return;
      }

      final Timestamp timestamp = Timestamp.now();
      final currentUserID = _auth.currentUser!.uid;
      final currentUserEmail = _auth.currentUser!.email!;

//send message model
      final messageM = MessageModel(
        senderID: currentUserID,
        senderEmail: currentUserEmail,
        receiverID: productModel.brand!.id,
        message: messages.text,
        timestamp: timestamp,
        userName: productModel.brand!.name,
        profilePicture: productModel.brand!.image,
      );

      //construct chat rrom ID for the two users(sorted to ensure uniqueness)
      List<String> ids = [currentUserID, productModel.brand!.id];
      ids.sort(); //sort the ids (this ensure the chattoomID is the same for any 2 people)
      String chatRoomID = ids.join('_');

      //clear the text controller
      messages.clear();

      //SEND/STORE new message to firebase
      await messageRepo.sendMessages(messageM, chatRoomID);
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Something went wrong try again later', message: e.toString());
    }
  }

  //!GET MESSAGES STREAM

  Stream<List<MessageModel>> getMessages({required String otherUserID}) {
    try {
      //get the current ID for the user who will send the message
      final currentUserID = _auth.currentUser!.uid;
      //construct a chatrrom ID for the two users
      List<String> ids = [currentUserID, otherUserID];
      ids.sort();
      String chatRoomID = ids.join('_');

      print('${currentUserID + otherUserID}COMBI ${'CHAT ROOM' + chatRoomID}');

      return messageRepo.fetchMessages(chatRoomID);
    } catch (e) {
      return TLoaders.errorSnackBar(
          title: 'Error try later', message: e.toString());
    }
  }
}
