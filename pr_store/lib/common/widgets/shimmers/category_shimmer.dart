import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/shimmers/shimmer.dart';
import 'package:pr_store/utils/constants/sizes.dart';

class PrCategoryShimmer extends StatelessWidget {
  const PrCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Image
                PrShimmerEffect(width: 55, height: 55, radius: 55),
                SizedBox(height: PrSizes.spaceBtwItems / 2),

                /// Text
                PrShimmerEffect(width: 55, height: 8),
              ],
            );
          },
          separatorBuilder: (_, __) => const SizedBox(
                width: PrSizes.spaceBtwItems,
              ),
          itemCount: itemCount),
    );
  }
}
