import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/features/shop/controllers/category/category_controller.dart';
import 'package:pr_store/features/shop/screens/sub_category/sub_categories.dart';

import '../../../../../common/widgets/image_text_widget/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class PrHomeCategories extends StatelessWidget {
  const PrHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoriesController = Get.put(CategoryController());
    return Obx(() {
      return SizedBox(
        height: 80,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            return PrVerticalImageText(
              image: PrImage.shoeIcon,
              title: 'Shoes',
              onTap: () => Get.to(() => const SubCategoriesScreen()),
            );
          },
        ),
      );
    });
  }
}
