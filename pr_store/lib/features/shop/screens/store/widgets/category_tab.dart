import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/common/widgets/texts/section_heading.dart';
import 'package:pr_store/features/shop/controllers/category/category_controller.dart';
import 'package:pr_store/features/shop/models/category_model.dart';
import 'package:pr_store/features/shop/screens/all_products/all_products.dart';
import 'package:pr_store/features/shop/screens/store/widgets/category_brand.dart';
import '../../../../../common/widgets/layouts/grid_layout/grid_layout.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';

class PrCategoryTab extends StatelessWidget {
  const PrCategoryTab({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(PrSizes.defaultSpace),
          child: Column(
            children: [
              ///------Brands-------///
              CategoryBrand(category: category),

              const SizedBox(
                height: PrSizes.spaceBtwItems,
              ),

              ///------Products-----///
              FutureBuilder(
                  future: controller.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {
                    /// Handel Loader, No data or Error Message
                    final response = PrCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: const PrVerticalProductShimmer());
                    if (response != null) return response;

                    final products = snapshot.data!;
                    return Column(
                      children: [
                        PrSectionHeading(
                          title: 'You might also like',
                          onPressed: () => Get.to(() => AllProducts(
                                title: category.name,
                                futureMethod: controller.getCategoryProducts(
                                    categoryId: category.id, limit: -1),
                              )),
                        ),
                        const SizedBox(height: PrSizes.spaceBtwItems),
                        PrGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) => PrProductCardVertical(
                            product: products[index],
                          ),
                        ),
                      ],
                    );
                  }),
            ],
          ),
        )
      ],
    );
  }
}
