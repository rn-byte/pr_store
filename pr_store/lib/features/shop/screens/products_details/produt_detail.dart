import 'package:flutter/material.dart';

import 'widgets/product_detail_image_slider.dart';

class PrProdutDetailScreen extends StatelessWidget {
  const PrProdutDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1. ------- Product Image Slider-------
            PrProductImageSlider()

            /// 2. ------- Product Details------------
          ],
        ),
      ),
    );
  }
}
