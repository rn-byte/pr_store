import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/common/widgets/texts/section_heading.dart';
import 'package:pr_store/features/shop/controllers/product/product_controller.dart';
import 'package:pr_store/features/shop/models/category_model.dart';
import 'package:pr_store/features/shop/screens/store/widgets/category_brand.dart';
import '../../../../../common/widgets/layouts/grid_layout/grid_layout.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../../utils/constants/sizes.dart';

class PrCategoryTab extends StatelessWidget {
  const PrCategoryTab({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
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
              PrSectionHeading(
                title: 'You might also like',
                onPressed: () {},
              ),
              const SizedBox(
                height: PrSizes.spaceBtwItems,
              ),
              Obx(() {
                //print('DEBUG : ${controller.featuredProduct.length}');
                if (controller.isLoading.value) return const PrVerticalProductShimmer();
                if (controller.featuredProduct.isEmpty) {
                  return Center(
                      child:
                          Text('No Data Found !', style: Theme.of(context).textTheme.bodyMedium));
                }
                return PrGridLayout(
                  itemCount: controller.featuredProduct.length,
                  itemBuilder: (_, index) => PrProductCardVertical(
                    product: controller.featuredProduct[index],
                  ),
                );
              }),
              const SizedBox(
                height: PrSizes.spaceBtwSections,
              )
            ],
          ),
        )
      ],
    );
  }
}
