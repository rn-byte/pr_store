import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/utils/helpers/helper.dart';

import '../../../../features/shop/screens/cart/cart.dart';
import '../../../../utils/constants/colors.dart';

class PrCartCounterIcon extends StatelessWidget {
  const PrCartCounterIcon({
    super.key,
    required this.iconColor,
    required this.onPressed,
  });
  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(() => const CartScreen()),
            icon: Icon(
              Iconsax.shopping_bag,
              color: iconColor,
            )),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: isDark ? PrColor.light : PrColor.dark,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context).textTheme.labelLarge!.apply(
                    color: isDark
                        ? PrColor.dark.withOpacity(0.8)
                        : PrColor.light.withOpacity(0.8)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
