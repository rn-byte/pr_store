import 'package:flutter/material.dart';

class PrColor {
  PrColor._();

  //App basic color
  static const Color primary = Color(0xFF4b68ff);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFB0C7FF);

  //Gradient color
  static const Gradient linearGradient = LinearGradient(
      begin: Alignment(0, 0),
      end: Alignment(0.707, -0.707),
      colors: [
        Color(0xFFFF9A9E),
        Color(0xFFFAD0C4),
        Color(0xFFFAD0C4),
      ]);

  //Text color
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C7570);
  static const Color textWhite = Colors.white;

  //Background color
  static const Color light = Color(0xFFf6f6f6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  //Background Container color
  static const Color lightContainer = Color(0xFFf6f6f6);
  static Color darkContainer = PrColor.white.withOpacity(0.1);

  //Button color
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6C7570);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  //Border color
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  //Error & validation color
  static const Color error = Color(0xFFD32f2f);
  static const Color success = Color(0xFF388e3c);
  static const Color warning = Color(0xFFF57c00);
  static const Color info = Color(0xFF1976d2);

  //Neutral shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4f4f4f);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFe0e0e0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9f9f9);
  static const Color white = Color(0xFFFFFFFF);
}
