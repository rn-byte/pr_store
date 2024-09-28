import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/brands/brand_card_widget.dart';
import 'package:pr_store/common/widgets/layouts/grid_layout/grid_layout.dart';
import 'package:pr_store/common/widgets/texts/section_heading.dart';
import 'package:pr_store/features/shop/screens/brand/brand_products.dart';
import 'package:pr_store/utils/constants/sizes.dart';

import '../../models/product_model.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key, required this.product});
  final ProductModel product;

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
              itemBuilder: (context, index) => PrBrandCard(
                showBorder: true,
                onTap: () => Get.to(() => BrandProducts(
                      product: product,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
