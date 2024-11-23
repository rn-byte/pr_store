import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/common/widgets/texts/product_price_text.dart';
import 'package:pr_store/features/shop/controllers/cart/cart_controller.dart';
import 'package:pr_store/utils/constants/sizes.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';

class PrCartItems extends StatelessWidget {
  const PrCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });
  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        separatorBuilder: (_, __) => const SizedBox(
          height: PrSizes.spaceBtwSections,
        ),
        itemBuilder: (_, index) => Obx(() {
          final item = cartController.cartItems[index];
          return Column(
            children: [
              PrCartItem(
                cartItem: item,
              ),
              if (showAddRemoveButton)
                const SizedBox(height: PrSizes.spaceBtwItems),
              if (showAddRemoveButton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Extra Space
                    Row(
                      children: [
                        SizedBox(width: 70),

                        /// Add Remove Button
                        PrProductQuantityWithAddRemoveButton(
                          quantity: item.quantity,
                          add: () => cartController.addOneToCart(item),
                          remove: () => cartController.removeOneFromCart(item),
                        ),
                      ],
                    ),
                    PrProductPriceText(
                        price: (item.price * item.quantity).toStringAsFixed(1))
                  ],
                )
            ],
          );
        }),
      ),
    );
  }
}
