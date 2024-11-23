import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/images/pr_rounded_image.dart';
import 'package:pr_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:pr_store/common/widgets/texts/product_title_text.dart';
import 'package:pr_store/features/shop/models/cart_item_model.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';

class PrCartItem extends StatelessWidget {
  const PrCartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return Row(
      children: [
        ///Image
        PrRoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          isNetworkImage: true,
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
              PrBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(
                child: PrProductTitleText(
                  title: cartItem.title,
                  maxLines: 1,
                ),
              ),

              ///Attributes
              Text.rich(
                TextSpan(
                    children: (cartItem.selectedVariation ?? {})
                        .entries
                        .map(
                          (e) => TextSpan(
                            children: [
                              TextSpan(
                                  text: '${e.key} : ',
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: '${e.value}  ',
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ],
                          ),
                        )
                        .toList()),
              )
            ],
          ),
        )
      ],
    );
  }
}
