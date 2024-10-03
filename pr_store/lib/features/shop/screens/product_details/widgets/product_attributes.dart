import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pr_store/common/widgets/texts/product_price_text.dart';
import 'package:pr_store/common/widgets/texts/product_title_text.dart';
import 'package:pr_store/common/widgets/texts/section_heading.dart';
import 'package:pr_store/features/shop/controllers/product/variations_controller.dart';
import 'package:pr_store/features/shop/models/product_model.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';
import '../../../../../common/widgets/chips/choice_chips.dart';

class PrProductAttributes extends StatelessWidget {
  const PrProductAttributes({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationsController());
    final isDark = PrHelper.isDarkMode(context);

    return Obx(
      () => Column(
        children: [
          /// Selected attribute Pricing and Description
          /// Display variation price and stock when some variation is selected
          if (controller.selectedVariation.value.id.isNotEmpty)
            PrRoundedContainer(
              padding: const EdgeInsets.all(PrSizes.md),
              backgroundColor: isDark ? PrColor.darkerGrey : PrColor.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                              if (controller.selectedVariation.value.salePrice > 0)
                                Text(
                                  "Rs. ${controller.selectedVariation.value.price}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(decoration: TextDecoration.lineThrough),
                                ),
                              const SizedBox(width: PrSizes.spaceBtwItems),

                              ///Sales price
                              PrProductPriceText(price: controller.getVariationPrice())
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
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),

                  ///Variation description
                  PrProductTitleText(
                    title: controller.selectedVariation.value.description ?? '',
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
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Colors
                      PrSectionHeading(
                        title: attribute.name ?? '',
                        showActionButton: false,
                      ),
                      const SizedBox(height: PrSizes.spaceBtwItems / 2),
                      Obx(
                        () => Wrap(
                          spacing: 8,
                          children: attribute.values!.map((attributeValues) {
                            final isSelected =
                                controller.selectedAttributes[attribute.name] == attributeValues;

                            final available = controller
                                .getAttributesAvailabilityInVariation(
                                    product.productVariations!, attribute.name!)
                                .contains(attributeValues);

                            return PrChoiceChip(
                                text: attributeValues,
                                selected: isSelected,
                                onSelected: available
                                    ? (selected) {
                                        if (selected && available) {
                                          controller.onAttributeSelected(
                                              product, attribute.name ?? '', attributeValues);
                                        }
                                      }
                                    : null);
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),

          ///Sizes
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     const PrSectionHeading(
          //       title: 'Sizes',
          //       showActionButton: false,
          //     ),
          //     const SizedBox(height: PrSizes.spaceBtwItems / 2),
          //     Wrap(
          //       spacing: 8,
          //       children: [
          //         PrChoiceChip(text: '40', selected: false, onSelected: (value) {}),
          //         PrChoiceChip(text: '41', selected: false, onSelected: (value) {}),
          //         PrChoiceChip(text: '42', selected: true, onSelected: (value) {}),
          //         PrChoiceChip(text: '43', selected: false, onSelected: (value) {}),
          //       ],
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
