import 'package:e_comerce_app/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

import 'custom_themes/elevated_button_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      //pending to add font family its necessary to download the font
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TTextTheme.lightTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.LightElevatedButtonTheme);
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      //pending to add font family its necessary to download the font
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TTextTheme.darkTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.LightElevatedButtonTheme);
}
