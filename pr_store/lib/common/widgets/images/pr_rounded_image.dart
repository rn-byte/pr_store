import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/shimmers/shimmer.dart';

import '../../../utils/constants/sizes.dart';

class PrRoundedImage extends StatelessWidget {
  const PrRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = PrSizes.md,
    this.margin,
  });
  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final EdgeInsets? margin;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            border: border,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
            borderRadius:
                applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
            child: isNetworkImage
                ? CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: fit,
                    progressIndicatorBuilder: (context, url, progress) =>
                        PrShimmerEffect(width: width ?? double.infinity, height: height ?? 158),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  )
                : Image(
                    image: AssetImage(imageUrl),
                    fit: fit,
                  )),
      ),
    );
  }
}
