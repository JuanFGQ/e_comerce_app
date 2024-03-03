import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String senderID;
  final String senderEmail;
  final String receiverID;
  final String message;
  final Timestamp timestamp;
  final String userName;
  final String profilePicture;

  MessageModel({
    required this.userName,
    required this.profilePicture,
    required this.senderID,
    required this.senderEmail,
    required this.receiverID,
    required this.message,
    required this.timestamp,
  });

  static MessageModel empty() => MessageModel(
        senderID: '',
        senderEmail: '',
        receiverID: '',
        message: '',
        timestamp: Timestamp.now(),
        userName: '',
        profilePicture: '',
      );

  //JSON FORMAT

  toJson() {
    return {
      'senderID': senderID,
      'senderEmail': senderEmail,
      'receiverID': receiverID,
      'message': message,
      'timeStamp': timestamp,
      'photoUrl': profilePicture,
      'userName': userName
    };
  }

  factory MessageModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return MessageModel.empty();

    final data = document.data()!;
    return MessageModel(
      senderID: data['senderID'],
      senderEmail: data['senderEmail'],
      receiverID: data['receiverID'],
      message: data['message'],
      timestamp: data['timestamp'],
      userName: data['userName'],
      profilePicture: data['photoUrl'],
    );
  }

  factory MessageModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    if (document.data() == null) return MessageModel.empty();

    final data = document.data() as Map<String, dynamic>;
    return MessageModel(
      senderID: data['senderID'],
      senderEmail: data['senderEmail'],
      receiverID: data['receiverID'],
      message: data['message'],
      timestamp: data['timestamp'],
      userName: data['userName'],
      profilePicture: data['photoUrl'],
    );
  }
}
