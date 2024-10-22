import 'package:flutter/material.dart';
import 'package:pr_store/utils/constants/sizes.dart';

class PrBillingAmountSection extends StatelessWidget {
  const PrBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sub Total ', style: Theme.of(context).textTheme.bodyMedium),
            Text('Rs. 258.8 ', style: Theme.of(context).textTheme.bodyMedium),
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
            Text('Rs. 50 ', style: Theme.of(context).textTheme.labelLarge),
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
            Text('Rs. 10 ', style: Theme.of(context).textTheme.labelLarge),
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
            Text('Rs. 328.8 ', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(
          height: PrSizes.spaceBtwItems / 2,
        ),
      ],
    );
  }
}
