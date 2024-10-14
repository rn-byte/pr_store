import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/shimmers/shimmer.dart';

import '../../../utils/constants/sizes.dart';

class PrHorizontalProductShimmer extends StatelessWidget {
  const PrHorizontalProductShimmer({
    super.key,
    this.itemCount = 1,
  });

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: PrSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: PrSizes.spaceBtwItems),
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Imaage
            PrShimmerEffect(width: 120, height: 120),
            SizedBox(width: PrSizes.spaceBtwItems),

            /// Text
            Column(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
