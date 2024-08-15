import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:pr_store/common/widgets/images/pr_rounded_image.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/constants/sizes.dart';

import '../../../../../utils/helpers/helper.dart';

class PrProductImageSlider extends StatelessWidget {
  const PrProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return PrCurvedEdgeWidget(
      child: Container(
        color: isDark ? PrColor.darkGrey : PrColor.light,
        child: Stack(
          children: [
            /// Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(PrSizes.productImageRadius * 2),
                child: Center(
                    child: Image(
                  image: AssetImage(
                    PrImage.productImage1,
                  ),
                )),
              ),
            ),

            ///Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: PrSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, index) => PrRoundedImage(
                        width: 80,
                        backgroundColor: isDark ? PrColor.dark : PrColor.white,
                        border: Border.all(color: PrColor.primary),
                        padding: const EdgeInsets.all(PrSizes.sm),
                        imageUrl: PrImage.productImage1),
                    separatorBuilder: (_, __) => const SizedBox(
                          width: PrSizes.spaceBtwItems,
                        ),
                    itemCount: 6),
              ),
            ),
            const PrAppBar(
              showBackArrow: true,
              actions: [
                Icon(
                  Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
