import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pr_store/features/shop/controllers/cart/cart_controller.dart';
import 'package:pr_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:pr_store/features/shop/screens/checkout/widgets/biling_amount_section.dart';
import 'package:pr_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:pr_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';
import 'package:pr_store/utils/helpers/pricing_calculator.dart';
import 'package:pr_store/utils/popups/loaders.dart';

import '../../../../common/widgets/app_bar/appbar.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../controllers/order/order_controller.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final subTotal = controller.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount =
        PrPricingCalculator.calculateTotalPrice(subTotal, 'NEP');
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
              const PrCouponCode(),
              const SizedBox(height: PrSizes.spaceBtwSections),

              ///Billing Section
              PrRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(PrSizes.md),
                backgroundColor: isDark ? PrColor.black : PrColor.white,
                child: const Column(
                  children: [
                    ///Pricing
                    PrBillingAmountSection(),
                    SizedBox(height: PrSizes.spaceBtwItems),

                    ///Divider
                    Divider(),
                    SizedBox(height: PrSizes.spaceBtwItems),

                    ///Payment methods
                    PrBillingPaymentSection(),
                    SizedBox(height: PrSizes.spaceBtwItems),

                    ///Adresss
                    PrBillingAddressSection(),
                    SizedBox(height: PrSizes.spaceBtwItems),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(PrSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: subTotal > 0
                ? () => orderController.processOrder(totalAmount)
                : () => PrLoaders.warningSnackBar(
                    title: 'Empty Cart',
                    message: 'Add items in the cart inorder to proceed.'),
            child: Text('Checkout Rs. $totalAmount')),
      ),
    );
  }
}
