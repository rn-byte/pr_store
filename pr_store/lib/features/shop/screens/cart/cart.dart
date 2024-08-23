import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/features/shop/screens/checkout/checkout.dart';
import 'package:pr_store/utils/constants/sizes.dart';

import 'widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: PrSizes.defaultSpace),
        child: PrCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(PrSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: const Text('Checkout Rs. 4999')),
      ),
    );
  }
}
