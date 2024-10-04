import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/features/shop/models/product_model.dart';
import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class PrSortableProducts extends StatelessWidget {
  const PrSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// DropDown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity']
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: PrSizes.spaceBtwSections),

        /// Products
        PrGridLayout(
            itemCount: 6,
            itemBuilder: (_, index) => PrProductCardVertical(
                  product: ProductModel.empty(),
                ))
      ],
    );
  }
}
