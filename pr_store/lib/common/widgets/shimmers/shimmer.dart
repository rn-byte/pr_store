import 'package:flutter/material.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/helpers/helper.dart';
import 'package:shimmer/shimmer.dart';

class PrShimmerEffect extends StatelessWidget {
  const PrShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
      this.radius = 15,
      this.color});

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color ?? (isDark ? PrColor.darkerGrey : PrColor.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
