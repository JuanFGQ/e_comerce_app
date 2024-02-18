// To parse this JSON data, do
//
//     final cartItemModel = cartItemModelFromJson(jsonString);

import 'dart:convert';

CartItemModel cartItemModelFromJson(String str) =>
    CartItemModel.fromJson(json.decode(str));

String cartItemModelToJson(CartItemModel data) => json.encode(data.toJson());

class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariation;

  CartItemModel(
      {required this.productId,
      required this.quantity,
      this.variationId = '',
      this.image,
      this.price = 0.0,
      this.title = '',
      this.brandName,
      this.selectedVariation});
  Map<String, dynamic> toJson() => {
        "productId": productId,
        "title": title,
        "price": price,
        "image": image,
        "quantity": quantity,
        "variationId": variationId,
        "brandName": brandName,
      };

  //EmptyCartModel
  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
      productId: json["productId"],
      title: json["title"],
      price: json["price"]?.toDouble(),
      image: json["image"],
      quantity: json["quantity"],
      variationId: json["variationId"],
      brandName: json["brandName"],
      selectedVariation: json['selectedVariation'] != null
          ? Map<String, String>.from(json['selectedVariation'])
          : null);
}
