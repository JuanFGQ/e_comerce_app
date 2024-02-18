import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app/features/personalization/models/address_model.dart';
import 'package:e_comerce_app/features/shop/models/cart_item_model.dart';
import 'package:e_comerce_app/utils/constants/enums.dart';
import 'package:e_comerce_app/utils/helpers/helper_function.dart';

class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;
  OrderModel(
      {required this.id,
      this.userId = '',
      required this.status,
      required this.totalAmount,
      required this.orderDate,
      this.paymentMethod = 'Paypal',
      this.address,
      this.deliveryDate,
      required this.items});

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "status": status.toString(),
        "totalAmount": totalAmount,
        "orderDate": orderDate,
        "paymentMethod": paymentMethod,
        "address": address?.toJson(),
        "deliveryDate": deliveryDate,
        "items": items.map((e) => e.toJson()).toList(),
      };

  String get formattedOrdeDate => THelperFunction.getFormattedDate(orderDate);

  String get formattedDeliveryDate => deliveryDate != null
      ? THelperFunction.getFormattedDate(deliveryDate!)
      : '';

  String get orderStatisText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
          ? 'Shipment on the way'
          : 'Processing';

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return OrderModel(
      id: data["id"] as String,
      userId: data["userId"] as String,
      status: OrderStatus.values
          .firstWhere((element) => element.toString() == data['status']),
      totalAmount: data["totalAmount"] as double,
      orderDate: (data["orderDate"] as Timestamp).toDate(),
      paymentMethod: data["paymentMethod"] as String,
      address: AddressModel.fromMap(data['address'] as Map<String, dynamic>),
      deliveryDate: data["deliveryDate"] == null
          ? null
          : (data['deliveryDate'] as Timestamp).toDate(),
      items: (data["items"] as List<dynamic>)
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
