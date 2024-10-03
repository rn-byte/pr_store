import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/images/pr_circular_image.dart';
import 'package:pr_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:pr_store/common/widgets/texts/product_price_text.dart';
import 'package:pr_store/common/widgets/texts/product_title_text.dart';
import 'package:pr_store/features/shop/controllers/product/product_controller.dart';
import 'package:pr_store/features/shop/models/product_model.dart';
import 'package:pr_store/utils/constants/enum.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper.dart';

class PrProductMetadata extends StatelessWidget {
  const PrProductMetadata({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final productStatus = controller.getProductStockStatus(product.stock);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Price and sale price
        Row(
          children: [
            ///Sale Tag
            PrRoundedContainer(
              radius: PrSizes.sm,
              backgroundColor: PrColor.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: PrSizes.sm, vertical: PrSizes.xs),
              child: Text(
                '$salePercentage%',
                style: Theme.of(context).textTheme.labelLarge!.apply(color: PrColor.black),
              ),
            ),
            const SizedBox(
              width: PrSizes.spaceBtwItems,
            ),

            ///Price
            if (product.productType == ProductType.single.toString() && product.salePrice > 0)
              PrProductPriceText(
                price: '${product.price}',
                lineThrough: true,
              ),
            // Text(
            //   'Rs. 180',
            //   style: Theme.of(context)
            //       .textTheme
            //       .titleSmall!
            //       .apply(decoration: TextDecoration.lineThrough),
            // ),
            if (product.productType == ProductType.single.toString() && product.salePrice > 0)
              const SizedBox(
                width: PrSizes.spaceBtwItems,
              ),
            PrProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(height: PrSizes.spaceBtwItems / 1.5),

        ///Title
        PrProductTitleText(title: product.title),
        const SizedBox(height: PrSizes.spaceBtwItems / 1.5),

        ///Stock status
        Row(
          children: [
            const PrProductTitleText(title: 'Status :'),
            const SizedBox(width: PrSizes.spaceBtwItems),
            Text(
              productStatus,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: PrSizes.spaceBtwItems / 1.5),

        ///Brand
        Row(
          children: [
            PrCircularImage(
              isNetworkImage: true,
              image: product.brand != null ? product.brand!.image : '',
              height: 32,
              width: 32,
              backgroundColor: Colors.transparent,
              overlayColor: isDark ? PrColor.white : PrColor.black,
            ),
            const SizedBox(width: PrSizes.spaceBtwItems * 0.5),
            PrBrandTitleWithVerifiedIcon(
              title: product.brand != null ? product.brand!.name : '',
              brandTextSize: TextSizes.medium,
            )
          ],
        )
      ],
    );
  }
}
