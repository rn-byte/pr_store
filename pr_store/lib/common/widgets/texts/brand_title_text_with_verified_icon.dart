import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/common/widgets/texts/brand_text_title.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enum.dart';
import '../../../utils/constants/sizes.dart';

class PrBrandTitleWithVerifiedIcon extends StatelessWidget {
  const PrBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = PrColor.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });
  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: PrBrandTitleText(
            title: title,
            maxLines: maxLines,
            color: textColor,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: PrSizes.xs),
        const Icon(Iconsax.verify5,
            color: PrColor.primary, size: PrSizes.iconXs)
      ],
    );
  }
}
