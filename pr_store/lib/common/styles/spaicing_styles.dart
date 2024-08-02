import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class PrSpacingStyle {
  PrSpacingStyle._();
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: PrSizes.appBarHeight,
    left: PrSizes.defaultSpace,
    right: PrSizes.defaultSpace,
    bottom: PrSizes.defaultSpace,
  );
}
