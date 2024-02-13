import 'dart:convert';

BrandModel brandModelFromJson(String str) =>
    BrandModel.fromJson(json.decode(str));

String brandModelToJson(BrandModel data) => json.encode(data.toJson());

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });

  static BrandModel empty() => BrandModel(id: '', image: '', name: '');
//Convert model to Json structure sio that you can store data in firebase
  toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "isFeatured": isFeatured,
      "productsCount": productsCount
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data["id"] ?? '',
      name: data["name"] ?? '',
      image: data["image"] ?? '',
      isFeatured: data["isFeatured"] ?? false,
      productsCount: data["productsCount"] ?? 0,
    );
  }
}
