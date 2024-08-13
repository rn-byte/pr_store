import 'package:flutter/material.dart';
import 'package:pr_store/features/shop/screens/products_details/widgets/product_metadata.dart';

import 'package:pr_store/utils/constants/sizes.dart';

import 'widgets/product_detail_image_slider.dart';
import 'widgets/rating_share_widget.dart';

class PrProdutDetailScreen extends StatelessWidget {
  const PrProdutDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1. ------- Product Image Slider-------
            PrProductImageSlider(),

            /// 2. ------- Product Details------------
            Padding(
              padding: EdgeInsets.only(
                left: PrSizes.defaultSpace,
                right: PrSizes.defaultSpace,
                bottom: PrSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  ///---- Rating And share button
                  PrRatingAndShare(),

                  ///---- Price, Title, Stock and brand
                  ProductMetadata()

                  ///---Attributes
                  ///--checkout button
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
