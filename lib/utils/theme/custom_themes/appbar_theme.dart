import 'package:flutter/material.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static const lightBarTheme = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black, size: 24),
      actionsIconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black));

  static const darkBarTheme = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black, size: 24),
      actionsIconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white));
}
