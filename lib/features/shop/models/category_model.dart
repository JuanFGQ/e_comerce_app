import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.image,
    required this.isFeatured,
    required this.name,
    this.parentId = '',
  });

  //EMPTY HELPER FUNCITON

  static CategoryModel empty() =>
      CategoryModel(id: '', image: '', isFeatured: false, name: '');

  //CONVERT MODEL TO JSON STRUCTURE SO THAT YOU CAN STORE DATA IN FIREBASE
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFeatured
    };
  }

  //MAP JSON ORIENTE DOCUMENT SNAPSHOT FROM FIREBASE TO USERMODEL
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      //MAP JSON RECORD TO THE MODEL
      return CategoryModel(
          id: document.id,
          image: data['Image'] ?? '',
          isFeatured: data['IsFeatured'] ?? false,
          name: data['Name'] ?? '',
          parentId: data['ParentId'] ?? '');
    } else {
      return CategoryModel.empty();
    }
  }
}
