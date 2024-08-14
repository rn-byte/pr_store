import 'package:flutter/material.dart';
import 'package:pr_store/features/shop/screens/products_details/widgets/product_attributes.dart';
import 'package:pr_store/features/shop/screens/products_details/widgets/product_metadata.dart';

import 'package:pr_store/utils/constants/sizes.dart';

import 'widgets/product_detail_image_slider.dart';
import 'widgets/rating_share_widget.dart';

class PrProdutDetailScreen extends StatelessWidget {
  const PrProdutDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1. ------- Product Image Slider-------
            const PrProductImageSlider(),

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
                  const PrProductMetadata(),

                  ///---Attributes
                  const PrProductAttributes(),
                  const SizedBox(height: PrSizes.spaceBtwSections),

                  ///--checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Checkout')),
                  )

                  ///---description
                  ///---review
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
