import 'package:flutter/material.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/pricing_calculator.dart';

import '../../../controllers/cart/cart_controller.dart';

class PrBillingAmountSection extends StatelessWidget {
  const PrBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final subTotal = controller.totalCartPrice.value;
    return Column(
      children: [
        /// SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sub Total ', style: Theme.of(context).textTheme.bodyMedium),
            Text('Rs. $subTotal ',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(
          height: PrSizes.spaceBtwItems / 2,
        ),

        /// Shiping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping fee ',
                style: Theme.of(context).textTheme.bodyMedium),
            Text(
                'Rs. ${PrPricingCalculator.calculateShippingCost(subTotal, 'NEP')} ',
                style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(
          height: PrSizes.spaceBtwItems / 2,
        ),

        /// Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('Rs. ${PrPricingCalculator.calculateTax(subTotal, 'NEP')} ',
                style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(
          height: PrSizes.spaceBtwItems / 2,
        ),

        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total ', style: Theme.of(context).textTheme.bodyMedium),
            Text(
                'Rs. ${PrPricingCalculator.calculateTotalPrice(subTotal, 'NEP')} ',
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(
          height: PrSizes.spaceBtwItems / 2,
        ),
      ],
    );
  }
}
