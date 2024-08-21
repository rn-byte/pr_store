import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/texts/product_price_text.dart';
import 'package:pr_store/utils/constants/sizes.dart';

import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(PrSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 10,
          separatorBuilder: (_, __) => const SizedBox(
            height: PrSizes.spaceBtwSections,
          ),
          itemBuilder: (_, index) => const Column(
            children: [
              PrCartItem(),
              SizedBox(height: PrSizes.spaceBtwItems),
              Row(
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
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(PrSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () {}, child: const Text('Checkout Rs. 4999')),
      ),
    );
  }
}
