import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';
import '../../../../common/widgets/brands/brand_card_widget.dart';

class PrBrandShowcase extends StatelessWidget {
  const PrBrandShowcase({
    super.key,
    required this.images,
  });
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return PrRoundedContainer(
      showBorder: true,
      borderColor: PrColor.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(PrSizes.md),
      margin: const EdgeInsets.only(bottom: PrSizes.spaceBtwItems),
      child: Column(
        children: [
          ///-----Brand with Product Count-----///

          const PrBrandCard(showBorder: false),

          ///-----Brand Top 3 Product image----///
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
      child: PrRoundedContainer(
    height: 100,
    backgroundColor:
        PrHelper.isDarkMode(context) ? PrColor.dark : PrColor.light,
    margin: const EdgeInsets.all(PrSizes.sm),
    padding: const EdgeInsets.all(PrSizes.md),
    child: Image(image: AssetImage(image)),
  ));
}
