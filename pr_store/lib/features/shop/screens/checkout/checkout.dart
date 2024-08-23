import 'package:flutter/material.dart';
import 'package:pr_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:pr_store/utils/constants/sizes.dart';

import '../../../../common/widgets/app_bar/appbar.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrAppBar(
        showBackArrow: true,
        title: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(PrSizes.defaultSpace),
          child: Column(
            children: [
              /// Items in cart
              PrCartItems(showAddRemoveButton: false),
              SizedBox(
                height: PrSizes.spaceBtwSections,
              )
            ],
          ),
        ),
      ),
    );
  }
}
