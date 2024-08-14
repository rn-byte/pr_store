import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/common/widgets/icons/pr_circular_icon.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';

class PrBottomAddToCart extends StatelessWidget {
  const PrBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: PrSizes.defaultSpace, vertical: PrSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: isDark ? PrColor.darkerGrey : PrColor.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(PrSizes.cardRadiusLg),
          topRight: Radius.circular(PrSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const PrCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: PrColor.darkGrey,
                width: 40,
                height: 40,
                color: PrColor.white,
              ),
              const SizedBox(
                width: PrSizes.spaceBtwItems,
              ),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(
                width: PrSizes.spaceBtwItems,
              ),
              const PrCircularIcon(
                icon: Iconsax.add,
                backgroundColor: PrColor.black,
                width: 40,
                height: 40,
                color: PrColor.white,
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(PrSizes.md),
                  backgroundColor: PrColor.black,
                  side: const BorderSide(color: PrColor.black)),
              child: const Text('Add to Cart'))
        ],
      ),
    );
  }
}
