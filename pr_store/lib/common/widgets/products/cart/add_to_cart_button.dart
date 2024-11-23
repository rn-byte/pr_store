import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/features/shop/models/product_model.dart';
import 'package:pr_store/utils/constants/enum.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class PrAddToCartButton extends StatelessWidget {
  const PrAddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// If product have variation then show product variation details for selection
        /// Else add the product to cart
        if (product.productVariations == ProductType.single.toString()) {
        } else {}
      },
      child: Container(
        decoration: const BoxDecoration(
          color: PrColor.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(PrSizes.cardRadiusMd),
              bottomRight: Radius.circular(PrSizes.productImageRadius)),
        ),
        child: const SizedBox(
          height: PrSizes.iconLg * 1.2,
          width: PrSizes.iconLg * 1.2,
          child: Center(
            child: Icon(
              Iconsax.add,
              color: PrColor.white,
            ),
          ),
        ),
      ),
    );
  }
}
