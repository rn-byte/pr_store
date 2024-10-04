import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/features/shop/controllers/product/all_product_controller.dart';
import 'package:pr_store/features/shop/models/product_model.dart';
import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class PrSortableProducts extends StatelessWidget {
  const PrSortableProducts({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    controller.assignProducts(products);
    return Column(
      children: [
        /// DropDown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            controller.sortProducts(value!);
          },
          items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity']
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: PrSizes.spaceBtwSections),

        /// Products
        Obx(
          () => PrGridLayout(
              itemCount: controller.products.length,
              itemBuilder: (_, index) => PrProductCardVertical(
                    product: controller.products[index],
                  )),
        )
      ],
    );
  }
}
