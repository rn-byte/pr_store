import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';

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
          PrRoundedContainer()

          ///-------Details--------------------///
        ],
      ),
    );
  }
}
