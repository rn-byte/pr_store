import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/images/pr_rounded_image.dart';
import 'package:pr_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:pr_store/common/widgets/texts/product_title_text.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';

class PrCartItem extends StatelessWidget {
  const PrCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return Row(
      children: [
        ///Image
        PrRoundedImage(
          imageUrl: PrImage.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(PrSizes.sm),
          backgroundColor: isDark ? PrColor.darkerGrey : PrColor.light,
        ),
        const SizedBox(
          width: PrSizes.spaceBtwItems,
        ),

        /// Title, Price, Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PrBrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(
                child: PrProductTitleText(
                  title: 'Nike Air Force Shoes ',
                  maxLines: 1,
                ),
              ),

              ///Attributes
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Color : ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Blue  ',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: 'Size : ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: '42', style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
