import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/features/shop/controllers/cart/cart_controller.dart';
import 'package:pr_store/features/shop/models/product_model.dart';
import 'package:pr_store/features/shop/screens/product_details/produt_detail.dart';
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
    final cartController = CartController.instance;
    return GestureDetector(
      onTap: () {
        /// If product have variation then show product variation details for selection
        /// Else add the product to cart
        if (product.productVariations == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => PrProdutDetailScreen(product: product));
        }
      },
      child: Obx(() {
        final productQuantityIncart =
            cartController.getProductQuantityInCart(product.id);
        return Container(
          decoration: BoxDecoration(
            color: productQuantityIncart > 0 ? PrColor.primary : PrColor.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(PrSizes.cardRadiusMd),
                bottomRight: Radius.circular(PrSizes.productImageRadius)),
          ),
          child: SizedBox(
            height: PrSizes.iconLg * 1.2,
            width: PrSizes.iconLg * 1.2,
            child: Center(
              child: productQuantityIncart > 0
                  ? Text(
                      productQuantityIncart.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: PrColor.white),
                    )
                  : Icon(
                      Iconsax.add,
                      color: PrColor.white,
                    ),
            ),
          ),
        );
      }),
    );
  }
}
