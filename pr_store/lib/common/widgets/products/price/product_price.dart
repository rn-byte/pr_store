import 'package:flutter/material.dart';
import 'package:pr_store/features/shop/models/product_model.dart';

import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../utils/constants/enum.dart';
import '../../../../utils/constants/sizes.dart';
import '../../texts/product_price_text.dart';

class PrProductPrice extends StatelessWidget {
  const PrProductPrice({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    return Flexible(
      child: Column(
        children: [
          if (product.productType == ProductType.single.toString() && product.salePrice > 0)
            Padding(
              padding: const EdgeInsets.only(left: PrSizes.sm),
              child: Text(
                product.price.toString(),
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
            ),

          /// Price, show sale price as main price if sale exist
          Padding(
            padding: const EdgeInsets.only(left: PrSizes.sm),
            child: PrProductPriceText(
              price: controller.getProductPrice(product),
            ),
          ),
        ],
      ),
    );
  }
}
