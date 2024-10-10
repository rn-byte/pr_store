import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/brands/brand_card_widget.dart';
import 'package:pr_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:pr_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:pr_store/features/shop/controllers/brand/brand_controller.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/cloud_helper_functions.dart';

import '../../models/brand_model.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({
    super.key,
    required this.brand,
  });
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: PrAppBar(
        title: Text(brand.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(PrSizes.defaultSpace),
        child: Column(
          children: [
            /// Brand Details
            PrBrandCard(
              showBorder: true,
              brand: brand,
            ),
            const SizedBox(height: PrSizes.spaceBtwSections),

            FutureBuilder(
              future: controller.getBrandProducts(brandId: brand.id),
              builder: (context, snapshot) {
                /// Handle loader, no record, Or Error message
                const loader = PrVerticalProductShimmer();
                final widget = PrCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);
                if (widget != null) return widget;

                final brandProducts = snapshot.data!;
                return PrSortableProducts(
                  products: brandProducts,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
