import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/common/styles/shadows.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pr_store/common/widgets/images/pr_rounded_image.dart';
import 'package:pr_store/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:pr_store/common/widgets/products/price/product_price.dart';
import 'package:pr_store/features/shop/controllers/product/product_controller.dart';
import 'package:pr_store/features/shop/models/product_model.dart';
import 'package:pr_store/features/shop/screens/product_details/produt_detail.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';
import '../../texts/brand_title_text_with_verified_icon.dart';
import '../../texts/product_title_text.dart';
import '../cart/add_to_cart_button.dart';

class PrProductCardVertical extends StatelessWidget {
  const PrProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);

    final isDark = PrHelper.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => PrProdutDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [
            PrShadowsStyle.verticalProductShadow,
          ],
          borderRadius: BorderRadius.circular(PrSizes.productImageRadius),
          color: isDark ? PrColor.darkerGrey : PrColor.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///-------Thumbnail,,,WishListButton,,, Discount Tag-------------///
            Center(
              child: PrRoundedContainer(
                height: 180,
                padding: const EdgeInsets.all(
                  PrSizes.sm,
                ),
                backgroundColor: isDark ? PrColor.dark : PrColor.light,
                child: Stack(
                  children: [
                    ///--------Thumbnail--------------///
                    PrRoundedImage(
                      height: 180,
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                      isNetworkImage: true,
                      fit: BoxFit.fill,
                    ),

                    //Sale Tag
                    if (salePercentage != null)
                      Positioned(
                        top: 10,
                        child: PrRoundedContainer(
                          radius: PrSizes.sm,
                          backgroundColor: PrColor.secondary.withOpacity(0.8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: PrSizes.sm, vertical: PrSizes.xs),
                          child: Text(
                            '$salePercentage%',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: PrColor.black),
                          ),
                        ),
                      ),

                    ///-------Fav Icon Button-----------///
                    Positioned(
                      top: 0,
                      right: 0,
                      child: PrFavouriteIcon(
                        productId: product.id,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: PrSizes.spaceBtwItems / 2,
            ),

            ///-------Details--------------------///
            Padding(
              padding: const EdgeInsets.only(left: PrSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrProductTitleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: PrSizes.spaceBtwItems / 2,
                  ),
                  //brand name
                  PrBrandTitleWithVerifiedIcon(
                    title: product.brand!.name,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //price
                PrProductPrice(product: product),

                ///add to cart button
                PrAddToCartButton(product: product)
              ],
            )
          ],
        ),
      ),
    );
  }
}
