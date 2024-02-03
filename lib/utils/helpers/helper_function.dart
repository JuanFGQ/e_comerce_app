import 'package:flutter/material.dart';
//IMPORT GET PACKAGE
//import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';

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

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  static void showAlert(String title, String message) {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK'))
            ],
          );
        });
  }

  static void navigateToScreen(BuildContext context, Widget scren) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => scren));
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(Get.context!).size.height;
  }
  // static double screenHeight() {
  //   BuildContext? context = Get.context;
  //   if (context != null) {
  //     return MediaQuery.of(context).size.height;
  //   } else {
  //     // Manejar el caso en el que el contexto es null, tal vez lanzar una excepción o proporcionar un valor predeterminado.
  //     // En este ejemplo, se devuelve 0, pero debes adaptarlo según tus necesidades.
  //     return 0;
  //   }
  // }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(Get.context!).size.width;
  }

  // static double screenWidth() {
  //   BuildContext? context = Get.context;
  //   if (context != null) {
  //     return MediaQuery.of(context).size.width;
  //   } else {
  //     // Manejar el caso en el que el contexto es null, tal vez lanzar una excepción o proporcionar un valor predeterminado.
  //     // En este ejemplo, se devuelve 0, pero debes adaptarlo según tus necesidades.
  //     return 0;
  //   }
  // }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicated<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(
        children: rowChildren,
      ));
    }
    return wrappedList;
  }
}
