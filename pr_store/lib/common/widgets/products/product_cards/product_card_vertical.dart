import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pr_store/common/widgets/images/pr_rounded_image.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';
import '../../icons/pr_circular_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';
import '../cart/add_to_cart_button.dart';

class PrProductCardVertical extends StatelessWidget {
  const PrProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(PrSizes.productImageRadius),
          color: isDark ? PrColor.darkerGrey : PrColor.light,
        ),
        child: Column(
          children: [
            ///-------Thumbnail,,,WishListButton,,, Discount Tag-------------///
            PrRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(
                PrSizes.sm,
              ),
              backgroundColor: isDark ? PrColor.dark : PrColor.light,
              child: Stack(
                children: [
                  ///--------Thumbnail--------------///
                  const PrRoundedImage(
                      imageUrl: PrImage.productImage1, applyImageRadius: true),

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
            const SizedBox(
              height: PrSizes.spaceBtwItems / 2,
            ),

            ///-------Details--------------------///
            Padding(
              padding: const EdgeInsets.only(left: PrSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PrProductTitleText(
                    title: 'Nike Air Force Shoes',
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: PrSizes.spaceBtwItems / 2,
                  ),
                  //brand name
                  Row(
                    children: [
                      Text(
                        'Nike',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(
                        width: PrSizes.xs,
                      ),
                      const Icon(
                        Iconsax.verify5,
                        color: PrColor.primary,
                        size: PrSizes.iconXs,
                      )
                    ],
                  ),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //price
                      PrProductPriceText(
                        price: '4999',
                      ),

                      ///add to cart button
                      PrAddToCartButton()
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
