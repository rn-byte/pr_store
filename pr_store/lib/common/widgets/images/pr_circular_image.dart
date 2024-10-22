import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/shimmers/shimmer.dart';

import '../../../utils/constants/colors.dart';
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: image,
                  fit: fit,
                  color: overlayColor,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const PrShimmerEffect(width: 55, height: 55),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  fit: fit,
                  image: AssetImage(image) as ImageProvider,
                  color: overlayColor,
                ),
        ),
      ),
    );
  }
}
