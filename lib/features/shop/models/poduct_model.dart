import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app/features/authentication/models/user/user_model.dart';
import 'package:e_comerce_app/features/shop/models/brand_model.dart';
import 'package:e_comerce_app/features/shop/models/product_attribute_model.dart';
import 'package:e_comerce_app/features/shop/models/product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  UserModel? userInfo;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.stock,
    required this.price,
    required this.title,
    required this.thumbnail,
    required this.productType,
    this.userInfo,
    this.salePrice = 0.0,
    this.date,
    this.sku,
    this.isFeatured,
    this.brand,
    this.description,
    this.categoryId,
    this.images,
    this.productAttributes,
    this.productVariations,
  });

//create empty func for clean code

  static ProductModel empty() => ProductModel(
      id: '', stock: 0, price: 0, title: '', thumbnail: '', productType: '');

//JSON FORMAT

  toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'isFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand?.toJson(),
      'User': userInfo?.toJson(),
      'Description': description,
      'ProductType': productType,
      'productAttributes': productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      'productVariatiosn': productVariations != null
          ? productVariations!.map((e) => e.toJson()).toList()
          : [],
    };
  }

  //Map Json oriented document snapshot from firebase to Model

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();

    final data = document.data()!;
    return ProductModel(
        id: document.id,
        sku: data['SKU'],
        title: data['Title'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        categoryId: data['CategoryId'] ?? '',
        description: data['Description'] ?? '',
        brand: BrandModel.fromJson(data['Brand']),
        userInfo: UserModel.fromJson(data['User']),
        images: data['Images'] != null ? List<String>.from(data['Images']) : [],
        productAttributes: (data['productAttributes'] as List<dynamic>)
            .map((e) => ProductAttributeModel.fromJson(e))
            .toList(),
        productVariations: (data['productVariatiosn'] as List<dynamic>)
            .map((e) => ProductVariationModel.fromJson(e))
            .toList(),
        stock: data['Stock'] ?? 0,
        price: double.parse((data['Price'] ?? 0.0).toString()),
        thumbnail: data['Thumbnail'] ?? '',
        salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
        productType: data['ProductType'] ?? '');
  }

  //Map Json oriented document snapshot from firebase to userModel

  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    if (document.data() == null) return ProductModel.empty();

    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
        id: document.id,
        sku: data['SKU'],
        title: data['Title'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        categoryId: data['CategoryId'] ?? '',
        description: data['Description'] ?? '',
        brand: BrandModel.fromJson(data['Brand']),
        images: data['Images'] != null ? List<String>.from(data['Images']) : [],
        productAttributes: (data['productAttributes'] as List<dynamic>)
            .map((e) => ProductAttributeModel.fromJson(e))
            .toList(),
        productVariations: (data['productVariatiosn'] as List<dynamic>)
            .map((e) => ProductVariationModel.fromJson(e))
            .toList(),
        stock: data['Stock'] ?? 0,
        price: double.parse((data['Price'] ?? 0.0).toString()),
        thumbnail: data['Thumbnail'] ?? '',
        productType: data['ProductType'] ?? '');
  }
}
