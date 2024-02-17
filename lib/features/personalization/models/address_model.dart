// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app/utils/formatters/formatter.dart';

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  String name;
  late final String id;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final DateTime? dateTime;
  bool selectedAddress;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.dateTime,
    this.selectedAddress = true,
  });

  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  static AddressModel empty() => AddressModel(
      id: '',
      name: '',
      phoneNumber: '',
      street: '',
      city: '',
      state: '',
      postalCode: '',
      country: '');

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phoneNumber": phoneNumber,
        "street": street,
        "city": city,
        "state": state,
        "postalCode": postalCode,
        "country": country,
        "dateTime": DateTime.now(),
        "selectedAddress": selectedAddress,
      };

  factory AddressModel.fromMap(Map<String, dynamic> data) => AddressModel(
        id: data["id"] as String,
        name: data["name"] as String,
        phoneNumber: data["phoneNumber"] as String,
        street: data["street"] as String,
        city: data["city"] as String,
        state: data["state"] as String,
        postalCode: data["postalCode"] as String,
        country: data["country"] as String,
        dateTime: (data["dateTime"] as Timestamp).toDate(),
        selectedAddress: data["selectedAddress"] as bool,
      );

  factory AddressModel.fromDocumentSnaphot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return AddressModel(
        id: snapshot.id,
        name: data['Name'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        street: data['street'] ?? '',
        city: data['city'] ?? '',
        state: data['state'] ?? '',
        postalCode: data['postalCode'] ?? '',
        country: data['country'] ?? '',
        dateTime: (data['dateTime'] as Timestamp).toDate(),
        selectedAddress: data['selectedAddress'] as bool);
  }

  @override
  String toString() {
    return '$street,$city,$state,$postalCode,$country';
  }
}
