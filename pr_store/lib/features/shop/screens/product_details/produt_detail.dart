import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/common/widgets/texts/section_heading.dart';
import 'package:pr_store/features/shop/models/product_model.dart';
import 'package:pr_store/features/shop/screens/checkout/checkout.dart';
import 'package:pr_store/features/shop/screens/product_review/product_reviews.dart';
import 'package:pr_store/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:pr_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:pr_store/features/shop/screens/product_details/widgets/product_metadata.dart';
import 'package:pr_store/utils/constants/enum.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';
import 'widgets/product_detail_image_slider.dart';
import 'widgets/rating_share_widget.dart';

class PrProdutDetailScreen extends StatelessWidget {
  const PrProdutDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: PrBottomAddToCart(
        product: product,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1. ------- Product Image Slider-------
            PrProductImageSlider(product: product),

            /// 2. ------- Product Details------------
            Padding(
              padding: const EdgeInsets.only(
                left: PrSizes.defaultSpace,
                right: PrSizes.defaultSpace,
                bottom: PrSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  ///---- Rating And share button
                  const PrRatingAndShare(),

                  ///---- Price, Title, Stock and brand
                  PrProductMetadata(product: product),

                  ///---Attributes
                  if (product.productType == ProductType.variable.toString())
                    PrProductAttributes(product: product),
                  if (product.productType == ProductType.variable.toString())
                    const SizedBox(height: PrSizes.spaceBtwSections),

                  ///--checkout button
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //       onPressed: () => Get.off(() => const CheckoutScreen()),
                  //       child: const Text('Checkout')),
                  // ),
                  const SizedBox(height: PrSizes.spaceBtwSections),

                  ///---description
                  const PrSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(height: PrSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show More',
                    trimExpandedText: '  Less',
                    moreStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  ///---review
                  const SizedBox(height: PrSizes.spaceBtwSections),
                  const Divider(),
                  const SizedBox(height: PrSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PrSectionHeading(
                        title: 'Reviews(199)',
                        onPressed: () {},
                        showActionButton: false,
                      ),
                      IconButton(
                        icon: const Icon(
                          Iconsax.arrow_right_3,
                          size: 18,
                        ),
                        onPressed: () => Get.to(() => const PrProductReviews()),
                      )
                    ],
                  ),
                  const SizedBox(height: PrSizes.spaceBtwSections * 2),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
