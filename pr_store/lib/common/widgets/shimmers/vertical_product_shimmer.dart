import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/shimmers/shimmer.dart';

import '../../../utils/constants/sizes.dart';
import '../layouts/grid_layout/grid_layout.dart';

class PrVerticalProductShimmer extends StatelessWidget {
  const PrVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return PrGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            PrShimmerEffect(width: 180, height: 180),
            SizedBox(height: PrSizes.spaceBtwItems),

            /// Text
            PrShimmerEffect(width: 110, height: 15),
            PrShimmerEffect(width: 160, height: 15),
            SizedBox(height: PrSizes.spaceBtwItems / 2),
          ],
        ),
      ),
    );
  }
}
