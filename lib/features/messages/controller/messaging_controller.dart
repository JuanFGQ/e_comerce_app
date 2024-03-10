import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_comerce_app/data/repositories/autentication/authentication_repository.dart';
import 'package:e_comerce_app/data/repositories/messages/messages_repository.dart';
import 'package:e_comerce_app/features/authentication/controllers/network/network_manager.dart';
import 'package:e_comerce_app/features/authentication/models/user/user_model.dart';
import 'package:e_comerce_app/features/messages/model/message_model.dart';
import 'package:e_comerce_app/features/personalization/controller/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  //user controller
  final userController = UserController.instance;
  //non readed messages
  RxInt nonReaded = 0.obs;
  //only once execute flag
  RxBool isExecutedFunction = false.obs;

  //! SEND MESSAGES
  Future<void> sendMessages({required String receptorID}) async {
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
        isRead: false,
        senderID: currentUserID,
        senderEmail: currentUserEmail,
        receiverID: receptorID,
        message: messages.text,
        timestamp: timestamp,
        userName: userController.user.value.fullName,
        profilePicture: userController.user.value.profilePicture,
      );

      //construct chat rrom ID for the two users(sorted to ensure uniqueness)
      List<String> ids = [currentUserID, receptorID];
      ids.sort(); //sort the ids (this ensure the chattoomID is the same for any 2 people)
      String chatRoomID = ids.join('_');

      //clear the text controller
      messages.clear();

      //SEND/STORE new message to firebase
      await messageRepo.sendMessages(messageM, chatRoomID);
    } catch (e) {
      JLoaders.errorSnackBar(
          title: 'Something went wrong try again later', message: e.toString());
    }
  }

  Future<void> storeChatRoomID({required String receptorID}) async {
    try {
      await messageRepo.storeChatRoom(otherUserID: receptorID);
    } catch (e) {
      return JLoaders.errorSnackBar(
          title: 'Error try later', message: e.toString());
    }
  }

  //!GET MESSAGES STREAM

  Stream<QuerySnapshot> getMessages({required String userID, otherUserID}) {
    try {
      //get the current ID for the user who will send the message
      final currentUserID = _auth.currentUser!.uid;
      //construct a chatrrom ID for the two users
      List<String> ids = [currentUserID, otherUserID];
      ids.sort();
      String chatRoomID = ids.join('_');

      return messageRepo.fetchMessages(chatRoomID);
    } catch (e) {
      return JLoaders.errorSnackBar(
          title: 'Error try later', message: e.toString());
    }
  }

  //!GET LAST MESSAGE

  Stream<QuerySnapshot> fetchLastMeesage() {
    try {
      final userId = AuthenticationRepository.instance.authUser.uid;

      final userID = messageRepo.getChatRoomID(userID: userId);
      //here i need to get the chatRoomIDS available for this user

      return messageRepo.fetchMessages(userID.toString());
    } catch (e) {
      return JLoaders.errorSnackBar(
          title: 'Error try later', message: e.toString());
    }
  }
}
