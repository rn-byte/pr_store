import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';

class PrProdutDetailScreen extends StatelessWidget {
  const PrProdutDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1. ------- Product Image Slider-------
            PrCurvedEdgeWidget(
              child: Container(
                color: isDark ? PrColor.darkGrey : PrColor.light,
                child: Stack(
                  children: [
                    /// Main Large Image
                    SizedBox(
                      height: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(
                            PrSizes.productImageRadius * 2),
                        child: Center(
                            child: Image(
                                image: AssetImage(PrImage.productImage8))),
                      ),
                    )
                  ],
                ),
              ),
            )

            /// 2. ------- Product Details------------
          ],
        ),
      ),
    );
  }
}
