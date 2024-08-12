import 'package:flutter/material.dart';
import '../../../../utils/constants/sizes.dart';

class PrGridLayout extends StatelessWidget {
  const PrGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisCount = 278,
    required this.itemBuilder,
  });
  final int itemCount;
  final double? mainAxisCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: PrSizes.gridViewSpacing,
        mainAxisSpacing: PrSizes.gridViewSpacing,
        mainAxisExtent: mainAxisCount,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
