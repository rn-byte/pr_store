import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/shimmers/shimmer.dart';
import 'package:pr_store/utils/constants/sizes.dart';

class PrListTileShimmer extends StatelessWidget {
  const PrListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            PrShimmerEffect(width: 50, height: 50, radius: 50),
            SizedBox(width: PrSizes.spaceBtwItems),
            Column(
              children: [
                PrShimmerEffect(width: 100, height: 15),
                SizedBox(height: PrSizes.spaceBtwItems / 2),
                PrShimmerEffect(width: 80, height: 12),
              ],
            )
          ],
        )
      ],
    );
  }
}
