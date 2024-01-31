import 'package:flutter/material.dart';
//IMPORT GET PACKAGE
//import 'package:get/get.dart';
//import 'package:intl/intl.dart';

class THelperFunction {
  static Color? getColor(String value) {
    ///DEFINE YOUR PRODUCT SPECIFIC COLORS HERE AND IT WILL MATCH THE ATTRIBUTE COLORS AND SHOW SPECIFIC
    ///
    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    } else if (value == 'Brown') {
      return Colors.brown;
    } else if (value == 'Teal') {
      return Colors.teal;
    } else if (value == 'Indigo') {
      return Colors.indigo;
    } else {
      return null;
    }
  }

static void showSnackBar(String message){
  ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text(message)))
}

static void showAlert(String title ,String message){
  showDialog(context: Get.context!, builder: (BuildContext context){
    return AlertDialog(
      title:Text(title) ,
      content: Text(message),
      actions: [
        TextButton(onPressed: onPressed, child: child)
      ],
    );
  })
}

}
