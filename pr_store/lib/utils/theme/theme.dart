import 'package:flutter/material.dart';
import 'package:pr_store/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:pr_store/utils/theme/custom_themes/text_theme.dart';

class PrAppTheme {
  PrAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: PrTextTheme.lightTextTheme,
    elevatedButtonTheme: PrElevatedButtonTheme.lightElevatedButtonTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: PrTextTheme.darkTextTheme,
    elevatedButtonTheme: PrElevatedButtonTheme.darkElevatedButtonTheme,
  );
}
