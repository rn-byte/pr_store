import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/icons/pr_circular_icon.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';

import '../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../utils/helpers/helper.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return Scaffold(
      appBar: PrAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PrSizes.defaultSpace),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 4,
            separatorBuilder: (_, __) => const SizedBox(
              height: PrSizes.spaceBtwSections,
            ),
            itemBuilder: (_, index) => Column(
              children: [
                const PrCartItem(),
                const SizedBox(height: PrSizes.spaceBtwItems),

                /// Add Remove Button
                Row(
                  children: [
                    PrCircularIcon(
                      icon: Iconsax.minus,
                      width: 32,
                      height: 32,
                      size: PrSizes.md,
                      color: isDark ? PrColor.white : PrColor.black,
                      backgroundColor:
                          isDark ? PrColor.darkerGrey : PrColor.light,
                    ),
                    const SizedBox(width: PrSizes.spaceBtwItems),
                    Text('2', style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(width: PrSizes.spaceBtwItems),
                    const PrCircularIcon(
                      icon: Iconsax.add,
                      width: 32,
                      height: 32,
                      size: PrSizes.md,
                      color: PrColor.white,
                      backgroundColor: PrColor.primary,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
