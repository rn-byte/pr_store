import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/brands/brand_card_widget.dart';
import 'package:pr_store/common/widgets/layouts/grid_layout/grid_layout.dart';
import 'package:pr_store/common/widgets/texts/section_heading.dart';
import 'package:pr_store/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrAppBar(title: Text('All Brands'), showBackArrow: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(PrSizes.defaultSpace),
        child: Column(
          children: [
            /// Heading
            const PrSectionHeading(
              title: 'Brands',
              showActionButton: false,
            ),
            const SizedBox(height: PrSizes.spaceBtwItems),

            /// Brands
            PrGridLayout(
              itemCount: 6,
              mainAxisExtent: 80,
              itemBuilder: (context, index) =>
                  const PrBrandCard(showBorder: true),
            )
          ],
        ),
      ),
    );
  }
}
