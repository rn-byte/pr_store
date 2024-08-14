import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pr_store/common/widgets/texts/product_price_text.dart';
import 'package:pr_store/common/widgets/texts/product_title_text.dart';
import 'package:pr_store/common/widgets/texts/section_heading.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';

import '../../../../../common/widgets/chips/choice_chips.dart';

class PrProductAttributes extends StatelessWidget {
  const PrProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return Column(
      children: [
        /// Selected attribute Pricing and Description
        PrRoundedContainer(
          padding: const EdgeInsets.all(PrSizes.md),
          backgroundColor: isDark ? PrColor.darkerGrey : PrColor.grey,
          child: Column(
            children: [
              /// TItle ,Price and stock status
              Row(
                children: [
                  const PrSectionHeading(
                    title: 'Variation : ',
                    showActionButton: false,
                  ),
                  const SizedBox(width: PrSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const PrProductTitleText(
                            title: 'Price :',
                            smallSize: true,
                          ),
                          const SizedBox(width: PrSizes.spaceBtwItems),

                          ///Actual Price
                          Text(
                            'Rs .250',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: PrSizes.spaceBtwItems),

                          ///Sales price
                          const PrProductPriceText(price: '175')
                        ],
                      ),

                      ///Stock
                      Row(
                        children: [
                          const PrProductTitleText(
                            title: 'Stock :',
                            smallSize: true,
                          ),
                          const SizedBox(width: PrSizes.spaceBtwItems),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),

              ///Variation description
              const PrProductTitleText(
                title:
                    'This is the description of the product and it can go upto max 4 lines',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(height: PrSizes.spaceBtwItems),

        ///Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Colors
            const PrSectionHeading(
              title: 'Colors',
              showActionButton: false,
            ),
            const SizedBox(height: PrSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                PrChoiceChip(
                    text: 'green', selected: false, onSelected: (value) {}),
                PrChoiceChip(
                    text: 'red', selected: true, onSelected: (value) {}),
                PrChoiceChip(
                    text: 'blue', selected: false, onSelected: (value) {}),
                PrChoiceChip(
                    text: 'orange', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),

        ///Sizes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PrSectionHeading(
              title: 'Sizes',
              showActionButton: false,
            ),
            const SizedBox(height: PrSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                PrChoiceChip(
                    text: '40', selected: false, onSelected: (value) {}),
                PrChoiceChip(
                    text: '41', selected: false, onSelected: (value) {}),
                PrChoiceChip(
                    text: '42', selected: true, onSelected: (value) {}),
                PrChoiceChip(
                    text: '43', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        )
      ],
    );
  }
}