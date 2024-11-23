import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pr_store/common/widgets/images/pr_rounded_image.dart';
import 'package:pr_store/common/widgets/products/cart/add_to_cart_button.dart';
import 'package:pr_store/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:pr_store/common/widgets/products/price/product_price.dart';
import 'package:pr_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:pr_store/common/widgets/texts/product_title_text.dart';
import 'package:pr_store/features/shop/models/product_model.dart';
import 'package:pr_store/utils/helpers/helper.dart';
import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class PrProductCardHorizontal extends StatelessWidget {
  const PrProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);

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
                SizedBox(
                  height: 120,
                  width: 120,
                  child: PrRoundedImage(
                    imageUrl: product.thumbnail,
                    applyImageRadius: true,
                    isNetworkImage: true,
                  ),
                ),

                //Sale Tag
                if (salePercentage != null)
                  Positioned(
                    top: 10,
                    child: PrRoundedContainer(
                      radius: PrSizes.sm,
                      backgroundColor: PrColor.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: PrSizes.sm, vertical: PrSizes.xs),
                      child: Text(
                        '$salePercentage%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: PrColor.black),
                      ),
                    ),
                  ),

                ///-------Fav ICon Button-----------///
                Positioned(
                  top: 0,
                  right: 0,
                  child: PrFavouriteIcon(
                    productId: product.id,
                  ),
                )
              ],
            ),
          ),

          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: PrSizes.sm, left: PrSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrProductTitleText(title: product.title, smallSize: true),
                      const SizedBox(height: PrSizes.spaceBtwItems / 2),
                      PrBrandTitleWithVerifiedIcon(title: product.brand!.name)
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      PrProductPrice(product: product),

                      /// Add to Cart Button
                      PrAddToCartButton(product: product)
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
