import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:pr_store/common/widgets/images/pr_rounded_image.dart';
import 'package:pr_store/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:pr_store/features/shop/controllers/product/images_controller.dart';
import 'package:pr_store/features/shop/models/product_model.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';

import '../../../../../utils/helpers/helper.dart';

class PrProductImageSlider extends StatelessWidget {
  const PrProductImageSlider({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);

    return PrCurvedEdgeWidget(
      child: Container(
        color: isDark ? PrColor.darkGrey : PrColor.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(PrSizes.productImageRadius * 2),
                child: Center(child: Obx(() {
                  final image = controller.selectedProductImage.value;
                  return GestureDetector(
                    onDoubleTap: () => controller.showEnlargedImage(image),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      progressIndicatorBuilder: (_, __, downloadProgress) =>
                          CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: PrColor.primary,
                      ),
                    ),
                  );
                })),
              ),
            ),

            ///Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: PrSizes.defaultSpace,
              child: SizedBox(
                height: 70,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, index) => Obx(() {
                          final imageSelected =
                              controller.selectedProductImage.value == images[index];
                          return PrRoundedImage(
                            isNetworkImage: true,
                            width: 70,
                            fit: BoxFit.fill,
                            backgroundColor: isDark ? PrColor.dark : PrColor.white,
                            border: Border.all(
                                color: imageSelected ? PrColor.primary : Colors.transparent),
                            padding: const EdgeInsets.all(PrSizes.sm),
                            imageUrl: images[index],
                            onPressed: () => controller.selectedProductImage.value = images[index],
                          );
                        }),
                    separatorBuilder: (_, __) => const SizedBox(
                          width: PrSizes.spaceBtwItems,
                        ),
                    itemCount: images.length),
              ),
            ),
            const PrAppBar(
              showBackArrow: true,
              actions: [
                PrFavouriteIcon(
                  backgroundColor: Colors.transparent,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
