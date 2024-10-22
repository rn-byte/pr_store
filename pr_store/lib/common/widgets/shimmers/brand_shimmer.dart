import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/layouts/grid_layout/grid_layout.dart';
import 'package:pr_store/common/widgets/shimmers/shimmer.dart';

class PrBrandShimmer extends StatelessWidget {
  const PrBrandShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return PrGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const PrShimmerEffect(width: 300, height: 80),
    );
  }
}
