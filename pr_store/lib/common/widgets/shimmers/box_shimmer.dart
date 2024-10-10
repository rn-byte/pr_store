import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/shimmers/shimmer.dart';
import 'package:pr_store/utils/constants/sizes.dart';

class PrBoxShimmer extends StatelessWidget {
  const PrBoxShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: PrShimmerEffect(width: 150, height: 110)),
            SizedBox(width: PrSizes.spaceBtwItems),
            Expanded(child: PrShimmerEffect(width: 150, height: 110)),
            SizedBox(width: PrSizes.spaceBtwItems),
            Expanded(child: PrShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
