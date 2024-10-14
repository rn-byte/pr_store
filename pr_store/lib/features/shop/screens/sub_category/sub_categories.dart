import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/images/pr_rounded_image.dart';
import 'package:pr_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:pr_store/common/widgets/texts/section_heading.dart';
import 'package:pr_store/features/shop/controllers/category/category_controller.dart';
import 'package:pr_store/features/shop/models/category_model.dart';
import 'package:pr_store/features/shop/screens/all_products/all_products.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/cloud_helper_functions.dart';

import '../../../../common/widgets/shimmers/horizontal_product_shimmer.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: PrAppBar(
        title: Text(category.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(PrSizes.defaultSpace),
        child: Column(
          children: [
            //Banner
            const PrRoundedImage(
                imageUrl: PrImage.promoBanner1,
                width: double.infinity,
                height: 150,
                applyImageRadius: true),
            const SizedBox(height: PrSizes.spaceBtwSections),

            /// Sub-Categories
            FutureBuilder(
              future: controller.getSubCategories(category.id),
              builder: (context, snapshot) {
                /// Handel Loader, No record Or Error message
                const loader = PrHorizontalProductShimmer();
                final widget = PrCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);
                if (widget != null) return widget;

                /// Record Found
                final subCategories = snapshot.data!;

                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategories.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      final subCategory = subCategories[index];
                      return FutureBuilder(
                          future: controller.getCategoryProducts(categoryId: category.id),
                          builder: (context, snapshot) {
                            /// Handel Loader, No record Or Error message
                            final widget = PrCloudHelperFunctions.checkMultiRecordState(
                                snapshot: snapshot, loader: loader);
                            if (widget != null) return widget;

                            /// Record Found
                            final products = snapshot.data!;
                            return Column(
                              children: [
                                /// Heading
                                PrSectionHeading(
                                  title: subCategory.name,
                                  onPressed: () => Get.to(() => AllProducts(
                                        title: subCategory.name,
                                        futureMethod: controller.getCategoryProducts(
                                            categoryId: subCategory.id, limit: -1),
                                      )),
                                ),
                                const SizedBox(height: PrSizes.spaceBtwItems / 2),

                                SizedBox(
                                  height: 120,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: products.length,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(width: PrSizes.spaceBtwItems),
                                    itemBuilder: (context, index) =>
                                        PrProductCardHorizontal(product: products[index]),
                                  ),
                                ),
                              ],
                            );
                          });
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
