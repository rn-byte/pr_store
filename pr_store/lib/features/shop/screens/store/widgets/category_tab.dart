import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/layouts/grid_layout.dart';
import 'package:pr_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:pr_store/common/widgets/texts/section_heading.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class PrCategoryTab extends StatelessWidget {
  const PrCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(PrSizes.defaultSpace),
          child: Column(
            children: [
              ///------Brands-------///
              const PrBrandShowcase(
                images: [
                  PrImage.productImage1,
                  PrImage.productImage2,
                  PrImage.productImage3
                ],
              ),
              const SizedBox(
                height: PrSizes.spaceBtwItems,
              ),

              ///------Products-----///
              PrSectionHeading(
                title: 'You might also like',
                onPressed: () {},
              ),
              const SizedBox(
                height: PrSizes.spaceBtwItems,
              ),
              PrGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => const PrProductCardVertical()),
              const SizedBox(
                height: PrSizes.spaceBtwSections,
              )
            ],
          ),
        )
      ],
    );
  }
}
