import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/texts/product_price_text.dart';
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
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      separatorBuilder: (_, __) => const SizedBox(
        height: PrSizes.spaceBtwSections,
      ),
      itemBuilder: (_, index) => Column(
        children: [
          const PrCartItem(),
          if (showAddRemoveButton)
            const SizedBox(height: PrSizes.spaceBtwItems),
          if (showAddRemoveButton)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Extra Space
                Row(
                  children: [
                    SizedBox(width: 70),

                    /// Add Remove Button
                    PrProductQuantityWithAddRemoveButton(),
                  ],
                ),
                PrProductPriceText(price: '4999')
              ],
            )
        ],
      ),
    );
  }
}
