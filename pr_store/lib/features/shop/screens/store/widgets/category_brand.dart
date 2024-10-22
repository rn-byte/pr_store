import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/brands/brand_show_case.dart';
import 'package:pr_store/features/shop/controllers/brand/brand_controller.dart';
import 'package:pr_store/features/shop/models/category_model.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/cloud_helper_functions.dart';
import '../../../../../common/widgets/shimmers/box_shimmer.dart';
import '../../../../../common/widgets/shimmers/list_tile_shimmer.dart';

class CategoryBrand extends StatelessWidget {
  const CategoryBrand({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandForCategory(category.id),
        builder: (context, snapshot) {
          /// Handel Loader, No data or Error Message
          const loader = Column(
            children: [
              PrListTileShimmer(),
              SizedBox(height: PrSizes.spaceBtwItems),
              PrBoxShimmer(),
              SizedBox(height: PrSizes.spaceBtwItems),
            ],
          );

          final widget =
              PrCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          /// Record Found
          final brands = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id, limit: 3),
                builder: (context, snapshot) {
                  /// Handel Loader, No data or Error Message
                  final widget = PrCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  /// Record found
                  final products = snapshot.data!;
                  return PrBrandShowcase(
                    images: products.map((e) => e.thumbnail).toList(),
                    brand: brand,
                  );
                },
              );
            },
          );
        });
  }
}
