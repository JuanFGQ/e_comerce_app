import 'package:e_comerce_app/utils/theme/custom_themes/appbar_theme.dart';
import 'package:e_comerce_app/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:e_comerce_app/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:e_comerce_app/utils/theme/custom_themes/outlined_bottom_theme.dart';
import 'package:e_comerce_app/utils/theme/custom_themes/text_field_theme.dart';
import 'package:e_comerce_app/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

import 'custom_themes/elevated_button_theme.dart';

class JAppTheme {
  JAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    // fontFamily: ,
    //pending to add font family its necessary to download the font
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: JTextTheme.lightTextTheme,
    elevatedButtonTheme: JElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: JAppBarTheme.lightBarTheme,
    checkboxTheme: JCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: JBottomSheeTheme.lightBottomSheetTheme,
    outlinedButtonTheme: JOutlineButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: JTextFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    // fontFamily: ,

    //pending to add font family its necessary to download the font
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: JTextTheme.darkTextTheme,
    elevatedButtonTheme: JElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: JAppBarTheme.darkBarTheme,
    checkboxTheme: JCheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: JBottomSheeTheme.darkBottomSheetTheme,
    outlinedButtonTheme: JOutlineButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: JTextFieldTheme.darkInputDecorationTheme,
  );
}
