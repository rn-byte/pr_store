import 'package:flutter/material.dart';
import 'package:pr_store/utils/constants/colors.dart';

class PrShadowsStyle {
  static final verticalProductShadow = BoxShadow(
    color: PrColor.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: PrColor.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
