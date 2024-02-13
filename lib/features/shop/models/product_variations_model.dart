class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributesValues;

  ProductVariationModel(
      {required this.id,
      this.sku = '',
      this.image = '',
      this.description = '',
      this.price = 0.0,
      this.salePrice = 0.0,
      this.stock = 0,
      required this.attributesValues});

  //create empty func for clean code

  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributesValues: {});

  //Json format

  toJson() {
    return {
      'Id': id,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'SKU': sku,
      'Stock': stock,
      'AttributeValues': attributesValues
    };
  }

  //Map Json oriented document snapshot from Firebase to Model

  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;

    if (data.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
        price: double.parse((data['Price'] ?? 0.0).toString()),
        sku: data['SKU'] ?? '',
        stock: data['Stock'] ?? 0,
        salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
        image: data['Image'] ?? '',
        id: data['Id'] ?? '',
        attributesValues: Map<String, String>.from(data['AttributeValues']));
  }
}
