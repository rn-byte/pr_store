import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pr_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:pr_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';

import '../../../../common/widgets/app_bar/appbar.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return Scaffold(
      appBar: PrAppBar(
        showBackArrow: true,
        title: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PrSizes.defaultSpace),
          child: Column(
            children: [
              /// Items in cart
              const PrCartItems(showAddRemoveButton: false),
              const SizedBox(height: PrSizes.spaceBtwSections),

              /// Coupon TextField
              PrCouponCode(),
              const SizedBox(height: PrSizes.spaceBtwSections),

              ///Billing Section
              PrRoundedContainer(
                showBorder: true,
                backgroundColor: isDark ? PrColor.black : PrColor.white,
                child: Column(
                  children: [
                    ///Pricing
                    PrBillingPaymentSection(),
                    const SizedBox(height: PrSizes.spaceBtwItems),

                    ///Divider
                    Divider(),
                    const SizedBox(height: PrSizes.spaceBtwItems),

                    ///Payment methods
                    ///Adresss
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
