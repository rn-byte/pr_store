import 'package:flutter/material.dart';
import 'package:pr_store/features/shop/models/brand_model.dart';

import '../../../utils/constants/colors.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/pr_circular_image.dart';
import '../texts/brand_title_text_with_verified_icon.dart';
import '../../../utils/constants/enum.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper.dart';

class PrBrandCard extends StatelessWidget {
  const PrBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
    required this.brand,
  });

  final BrandModel brand;
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
                isNetworkImage: true,
                image: brand.image,
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
                  PrBrandTitleWithVerifiedIcon(
                    title: brand.name,
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '${brand.productsCount} products',
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
