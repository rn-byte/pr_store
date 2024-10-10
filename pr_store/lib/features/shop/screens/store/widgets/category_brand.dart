import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/brands/brand_show_case.dart';
import 'package:pr_store/features/shop/controllers/brand/brand_controller.dart';
import 'package:pr_store/features/shop/models/category_model.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import '../../../../../common/widgets/shimmers/box_shimmer.dart';
import '../../../../../common/widgets/shimmers/list_tile_shimmer.dart';
import '../../../../../utils/constants/image_strings.dart';

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
          return PrBrandShowcase(
            images: [PrImage.productImage1, PrImage.productImage2, PrImage.productImage3],
          );
        });
  }
}
