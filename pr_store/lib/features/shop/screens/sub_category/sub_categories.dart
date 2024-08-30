import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/images/pr_rounded_image.dart';
import 'package:pr_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:pr_store/common/widgets/texts/section_heading.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrAppBar(
        title: Text('Sports'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(PrSizes.defaultSpace),
        child: Column(
          children: [
            //Banner
            const PrRoundedImage(
                imageUrl: PrImage.promoBanner1,
                width: double.infinity,
                height: 150,
                applyImageRadius: true),
            const SizedBox(height: PrSizes.spaceBtwSections),

            /// Sub-Categories
            Column(
              children: [
                /// Heading
                PrSectionHeading(
                  title: 'Sports Shirts',
                  onPressed: () {},
                ),
                const SizedBox(height: PrSizes.spaceBtwItems / 2),

                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: PrSizes.spaceBtwItems),
                    itemBuilder: (context, index) =>
                        const PrProductCardHorizontal(),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
