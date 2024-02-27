import 'package:cloud_firestore/cloud_firestore.dart';

class MessagingModel {
  final String senderID;
  final String senderEmail;
  final String receiverID;
  final String message;
  final Timestamp timestamp;

  MessagingModel({
    required this.senderID,
    required this.senderEmail,
    required this.receiverID,
    required this.message,
    required this.timestamp,
  });

  static MessagingModel empty() => MessagingModel(
      senderID: '',
      senderEmail: '',
      receiverID: 'receiverID',
      message: 'message',
      timestamp: Timestamp.now());

  //JSON FORMAT

  toJson() {
    return {
      'senderID': senderID,
      'senderEmail': senderEmail,
      'receiverID': receiverID,
      'message': message,
      'timeStamp': timestamp
    };
  }

  factory MessagingModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return MessagingModel.empty();

    final data = document.data()!;
    return MessagingModel(
        senderID: data['senderID'],
        senderEmail: data['senderEmail'],
        receiverID: data['receiverID'],
        message: data['message'],
        timestamp: data['timestamp']);
  }

  factory MessagingModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    if (document.data() == null) return MessagingModel.empty();

    final data = document.data() as Map<String, dynamic>;
    return MessagingModel(
        senderID: data['senderID'],
        senderEmail: data['senderEmail'],
        receiverID: data['receiverID'],
        message: data['message'],
        timestamp: data['timestamp']);
  }
}
