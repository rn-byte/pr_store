import 'package:flutter/material.dart';
import 'package:pr_store/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';

class PrRoundedContainer extends StatelessWidget {
  const PrRoundedContainer({
    super.key,
    this.height,
    this.width,
    this.radius = PrSizes.cardRadiusLg,
    this.padding,
    this.child,
    this.backgroundColor = PrColor.white,
    this.margin,
    this.showBorder = false,
    this.borderColor = PrColor.borderPrimary,
  });
  final double? height;
  final double? width;
  final double radius;
  final bool showBorder;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
