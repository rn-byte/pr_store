import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper.dart';

class PrCircularImage extends StatelessWidget {
  const PrCircularImage({
    super.key,
    this.height = 56,
    this.width = 56,
    this.padding = PrSizes.sm,
    this.backgroundColor,
    this.overlayColor,
    this.isNetworkImage = false,
    this.fit = BoxFit.cover,
    required this.image,
  });

  final double height, width, padding;
  final Color? backgroundColor;
  final Color? overlayColor;
  final bool isNetworkImage;
  final BoxFit? fit;
  final String image;

  @override
  Widget build(BuildContext context) {
    final bool isDark = PrHelper.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor ?? (isDark ? PrColor.black : PrColor.white),
      ),
      child: Image(
        fit: fit,
        image: isNetworkImage
            ? NetworkImage(image)
            : const AssetImage(PrImage.clothIcon) as ImageProvider,
        color: overlayColor,
      ),
    );
  }
}
