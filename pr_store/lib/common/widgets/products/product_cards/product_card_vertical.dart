import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pr_store/common/widgets/images/pr_rounded_image.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';

import '../../icons/pr_circular_icon.dart';

class PrProductCardVertical extends StatelessWidget {
  const PrProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return Container(
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
                const PrCircularIcon()
              ],
            ),
          ),

          ///-------Details--------------------///
        ],
      ),
    );
  }
}
