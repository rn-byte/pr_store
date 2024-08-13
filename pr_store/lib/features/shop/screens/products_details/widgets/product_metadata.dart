import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/images/pr_circular_image.dart';
import 'package:pr_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:pr_store/common/widgets/texts/product_price_text.dart';
import 'package:pr_store/common/widgets/texts/product_title_text.dart';
import 'package:pr_store/utils/constants/enum.dart';
import 'package:pr_store/utils/constants/image_strings.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper.dart';

class ProductMetadata extends StatelessWidget {
  const ProductMetadata({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Price and sale price
        Row(
          children: [
            ///Sale Tag
            PrRoundedContainer(
              radius: PrSizes.sm,
              backgroundColor: PrColor.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: PrSizes.sm, vertical: PrSizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: PrColor.black),
              ),
            ),
            const SizedBox(
              width: PrSizes.spaceBtwItems,
            ),

            ///Price
            Text(
              'Rs. 250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: PrSizes.spaceBtwItems,
            ),
            const PrProductPriceText(
              price: '175',
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(height: PrSizes.spaceBtwItems / 1.5),

        ///Title
        const PrProductTitleText(title: 'Nike Air Force Shoes'),
        const SizedBox(height: PrSizes.spaceBtwItems / 1.5),

        ///Stock status
        Row(
          children: [
            const PrProductTitleText(title: 'Status'),
            const SizedBox(width: PrSizes.spaceBtwItems),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: PrSizes.spaceBtwItems / 1.5),

        ///Brand
        Row(
          children: [
            PrCircularImage(
              image: PrImage.nike,
              height: 32,
              width: 32,
              overlayColor: isDark ? PrColor.white : PrColor.black,
            ),
            const PrBrandTitleWithVerifiedIcon(
              title: 'Nike',
              brandTextSize: TextSizes.medium,
            )
          ],
        )
      ],
    );
  }
}
