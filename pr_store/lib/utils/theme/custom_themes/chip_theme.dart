import 'package:flutter/material.dart';
import 'package:pr_store/utils/constants/colors.dart';

class PrChipTheme {
  PrChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: PrColor.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: PrColor.black),
    selectedColor: PrColor.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: PrColor.white,
  );
  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: PrColor.darkGrey,
    labelStyle: TextStyle(color: PrColor.white),
    selectedColor: PrColor.primary,
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: PrColor.white,
  );
}
