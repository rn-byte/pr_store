import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/common/widgets/shimmers/category_shimmer.dart';
import 'package:pr_store/features/shop/controllers/category/category_controller.dart';
import 'package:pr_store/features/shop/screens/sub_category/sub_categories.dart';
import 'package:pr_store/utils/constants/colors.dart';
import '../../../../../common/widgets/image_text_widget/vertical_image_text.dart';

class PrHomeCategories extends StatelessWidget {
  const PrHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoriesController = Get.put(CategoryController());
    return Obx(() {
      if (categoriesController.isLoading.value) {
        return const PrCategoryShimmer();
      }

      if (categoriesController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No Data Found !',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: PrColor.white),
          ),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categoriesController.featuredCategories.length,
          itemBuilder: (_, index) {
            final category = categoriesController.featuredCategories[index];
            return PrVerticalImageText(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() => const SubCategoriesScreen()),
            );
          },
        ),
      );
    });
  }
}
