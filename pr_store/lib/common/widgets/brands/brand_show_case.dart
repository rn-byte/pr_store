import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pr_store/common/widgets/shimmers/shimmer.dart';
import 'package:pr_store/features/shop/models/brand_model.dart';
import 'package:pr_store/features/shop/screens/brand/brand_products.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';
import '../../../../common/widgets/brands/brand_card_widget.dart';

class PrBrandShowcase extends StatelessWidget {
  const PrBrandShowcase({
    super.key,
    required this.images,
    required this.brand,
  });
  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: PrRoundedContainer(
        showBorder: true,
        borderColor: PrColor.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(PrSizes.md),
        margin: const EdgeInsets.only(bottom: PrSizes.spaceBtwItems),
        child: Column(
          children: [
            ///-----Brand with Product Count-----///

            PrBrandCard(
              showBorder: false,
              brand: brand,
            ),
            const SizedBox(
              height: PrSizes.spaceBtwItems,
            ),

            ///-----Brand Top 3 Product image----///
            Row(
              children: images.map((image) => brandTopProductImageWidget(image, context)).toList(),
            )
          ],
        ),
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
      child: PrRoundedContainer(
    height: 100,
    backgroundColor: PrHelper.isDarkMode(context) ? PrColor.dark : PrColor.light,
    margin: const EdgeInsets.all(PrSizes.sm),
    padding: const EdgeInsets.all(PrSizes.md),
    child: CachedNetworkImage(
      fit: BoxFit.contain,
      imageUrl: image,
      progressIndicatorBuilder: (context, url, progress) =>
          const PrShimmerEffect(width: 100, height: 100),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    ),
  ));
}
