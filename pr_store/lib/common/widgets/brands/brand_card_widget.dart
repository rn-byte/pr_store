import 'package:flutter/material.dart';

import '../custom_shapes/containers/rounded_container.dart';
import '../images/pr_circular_image.dart';
import '../texts/brand_title_text_with_verified_icon.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enum.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper.dart';

class PrBrandCard extends StatelessWidget {
  const PrBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isDark = PrHelper.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,

      /// container Design
      child: PrRoundedContainer(
        padding: const EdgeInsets.all(PrSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //icon
            Flexible(
              child: PrCircularImage(
                isNetworkImage: false,
                image: PrImage.clothIcon,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? PrColor.white : PrColor.black,
              ),
            ),
            const SizedBox(width: PrSizes.spaceBtwItems / 2),

            ///--------- Text------------------///
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PrBrandTitleWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '256 products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
