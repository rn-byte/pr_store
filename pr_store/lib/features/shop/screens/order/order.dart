import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/features/shop/screens/order/widgets/orders_list.dart';
import 'package:pr_store/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar
      appBar: PrAppBar(
        title:
            Text('My Order', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(PrSizes.defaultSpace),

        /// orders
        child: PrOrderListItems(),
      ),
    );
  }
}
