import 'package:flutter/material.dart';
import 'package:pr_store/utils/theme/custom_themes/appbar_theme.dart';
import 'package:pr_store/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:pr_store/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:pr_store/utils/theme/custom_themes/chip_theme.dart';
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
    appBarTheme: PrAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: PrBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: PrCheckBoxTheme.lightCheckBoxTheme,
    chipTheme: PrChipTheme.lightChipTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: PrTextTheme.darkTextTheme,
    elevatedButtonTheme: PrElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: PrAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: PrBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: PrCheckBoxTheme.darkCheckBoxTheme,
    chipTheme: PrChipTheme.darkChipTheme,
  );
}
