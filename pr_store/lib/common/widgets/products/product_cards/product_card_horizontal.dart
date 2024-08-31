import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pr_store/common/widgets/images/pr_rounded_image.dart';
import 'package:pr_store/common/widgets/products/cart/add_to_cart_button.dart';
import 'package:pr_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:pr_store/common/widgets/texts/product_price_text.dart';
import 'package:pr_store/common/widgets/texts/product_title_text.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/helpers/helper.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/pr_circular_icon.dart';

class PrProductCardHorizontal extends StatelessWidget {
  const PrProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        //boxShadow: [PrShadowsStyle.horizontalProductShadow],
        borderRadius: BorderRadius.circular(PrSizes.productImageRadius),
        color: isDark ? PrColor.darkContainer : PrColor.softGrey,
      ),
      child: Row(
        children: [
          /// Thumbnail, Wishlist button & Discount Tag
          PrRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(PrSizes.sm),
            backgroundColor: isDark ? PrColor.darkerGrey : PrColor.white,
            child: Stack(
              children: [
                /// Thumbnail Image
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: PrRoundedImage(
                    imageUrl: PrImage.productImage6,
                    applyImageRadius: true,
                  ),
                ),

                //Sale Tag
                Positioned(
                  top: 10,
                  child: PrRoundedContainer(
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
                ),

                ///-------Fav ICon Button-----------///
                const Positioned(
                  top: 0,
                  right: 0,
                  child: PrCircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),

          /// Details
          const SizedBox(
            width: 172,
            child: Padding(
              padding: EdgeInsets.only(top: PrSizes.sm, left: PrSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrProductTitleText(
                          title: 'Green Nike Half Sleeves Shirt',
                          smallSize: true),
                      SizedBox(height: PrSizes.spaceBtwItems / 2),
                      PrBrandTitleWithVerifiedIcon(title: 'Nike')
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      Flexible(child: PrProductPriceText(price: '256.0')),

                      /// Add to Cart Button
                      PrAddToCartButton()
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
