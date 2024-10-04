import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/brands/brand_card_widget.dart';
import 'package:pr_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:pr_store/features/shop/models/product_model.dart';
import 'package:pr_store/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PrAppBar(
        title: Text('Nike'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(PrSizes.defaultSpace),
        child: Column(
          children: [
            /// Brand Details
            PrBrandCard(showBorder: true),
            SizedBox(height: PrSizes.spaceBtwSections),

            PrSortableProducts(
              products: [],
            ),
          ],
        ),
      ),
    );
  }
}
