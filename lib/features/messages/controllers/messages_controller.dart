import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app/common/widgets/loaders/loaders.dart';
import 'package:e_comerce_app/data/repositories/messages/messages_repository.dart';
import 'package:e_comerce_app/features/authentication/controllers/network/network_manager.dart';
import 'package:e_comerce_app/features/messages/models/messages_mode.dart';
import 'package:e_comerce_app/utils/constants/image_strings.dart';
import 'package:e_comerce_app/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class MessagesController extends GetxController {
  static MessagesController get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  final messageRepo = Get.put(MessagingRepository());
  final _db = FirebaseFirestore.instance;
  Future sendMessages(String receiverID, message) async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Storing Addres...', TImages.handLoading);

      //check internet connectivity

      final isConneted = await NetworkManager.instance.isConnected();
      if (!isConneted) {
        TFullScreenLoader.stopLoading();
        return;
      }
      final Timestamp timestamp = Timestamp.now();
      final currentUserID = _auth.currentUser!.uid;
      final currentUserEmail = _auth.currentUser!.email!;
//send message model
      final messageM = MessagingModel(
          senderID: currentUserID,
          senderEmail: currentUserEmail,
          receiverID: receiverID,
          message: message,
          timestamp: timestamp);

      //construct chat rrom ID for the two users(sorted to ensure uniqueness)
      List<String> ids = [currentUserID, receiverID];
      ids.sort(); //sort the ids (this ensure the chattoomID is the same for any 2 people)
      String chatRoomID = ids.join('_');

      //SEND/STORE new message to firebase
      await messageRepo.sendMessages(messageM, chatRoomID);
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Something went wrong try again later', message: e.toString());
    }
  }

  Future getMessages() {}
}
