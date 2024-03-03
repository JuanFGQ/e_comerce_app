import 'package:flutter/material.dart';

class JColors {
  JColors._();

//BASIC COLORS
  static const Color primary = Color(0xff4b68ff);
  static const Color secondary = Color(0xff4b68ff);
  static const Color accent = Color(0xff4b68ff);

  //GRADIENT COLORS

  static const Gradient linearGradient = LinearGradient(colors: [
    Color(0xffff9a9e),
    Color(0xfffad0c4),
    Color(0xfffad0c4),
  ], begin: Alignment(0.0, 0.0), end: Alignment(0.707, -0.707));

//TEXT COLORS
  static const Color textPrimary = Color(0xff4b68ff);
  static const Color textSecondary = Color(0xff4b68ff);
  static const Color textWhite = Color.fromARGB(255, 242, 242, 243);

  //BACKGROUND COLORS

  static const Color light = Color.fromARGB(255, 248, 249, 250);
  static const Color dark = Color.fromARGB(255, 16, 16, 16);
  static const Color primaryBackGround = Color(0xff4b68ff);

  //BACKGROUND CONTAINER COLORS

  static const Color lightContainer = Color(0xff4b68ff);
  static const Color darkContainer = Color(0xff4b68ff);

  //BUTTON COLORS
  static const Color buttonPrimary = Color(0xff4b68ff);
  static const Color buttonSecondary = Color(0xff4b68ff);
  static const Color buttonDisabled = Color(0xff4b68ff);

  //BORDER COLORS
  // static const Color borderPrimary = Color(0xff4b68ff);
  // static const Color borderSecondary = Color(0xff4b68ff);

  //ERROR AND VALIDARION COLORS
  static const Color error = Color(0xff4b68ff);
  static const Color success = Color(0xff4b68ff);
  static const Color warning = Color(0xff4b68ff);
  static const Color info = Color(0xff4b68ff);

  //NEUTRAL SHADES

  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color darkGrey = Color.fromARGB(255, 61, 61, 61);
  static const Color darkerGrey = Color.fromARGB(255, 49, 49, 49);
  static const Color grey = Color.fromARGB(255, 158, 158, 158);
  static const Color softGrey = Color(0xff4b68ff);
  static const Color lightGrey = Color.fromARGB(255, 242, 243, 244);
  static const Color white = Color.fromARGB(255, 255, 255, 255);
}
