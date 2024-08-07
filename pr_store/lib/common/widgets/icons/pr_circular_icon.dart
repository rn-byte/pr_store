import 'package:flutter/material.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper.dart';

class PrCircularIcon extends StatelessWidget {
  const PrCircularIcon({
    super.key,
    this.height,
    this.width,
    this.size = PrSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });
  final double? height, width, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final bool isDark = PrHelper.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor ??
            (isDark
                ? PrColor.black.withOpacity(0.9)
                : PrColor.white.withOpacity(0.9)),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
