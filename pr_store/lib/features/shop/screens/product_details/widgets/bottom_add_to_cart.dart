import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/common/widgets/icons/pr_circular_icon.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';

import '../../../controllers/cart/cart_controller.dart';
import '../../../models/product_model.dart';

class PrBottomAddToCart extends StatelessWidget {
  const PrBottomAddToCart({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
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
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                PrCircularIcon(
                  icon: Iconsax.minus,
                  backgroundColor: PrColor.darkGrey,
                  width: 40,
                  height: 40,
                  color: PrColor.white,
                  onPressed: () => controller.productQuantityInCart.value < 1
                      ? null
                      : controller.productQuantityInCart.value -= 1,
                ),
                const SizedBox(
                  width: PrSizes.spaceBtwItems,
                ),
                Text(controller.productQuantityInCart.value.toString(),
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(
                  width: PrSizes.spaceBtwItems,
                ),
                PrCircularIcon(
                  icon: Iconsax.add,
                  backgroundColor: PrColor.black,
                  width: 40,
                  height: 40,
                  color: PrColor.white,
                  onPressed: () => controller.productQuantityInCart.value += 1,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: controller.productQuantityInCart.value < 1
                  ? null
                  : () => controller.addToCart(product),
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(PrSizes.md),
                  backgroundColor: PrColor.black,
                  side: const BorderSide(color: PrColor.black)),
              child: const Text('Add to Cart'),
            )
          ],
        ),
      ),
    );
  }
}
