import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';

class PrOrderListItems extends StatelessWidget {
  const PrOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(
        height: PrSizes.spaceBtwItems,
      ),
      itemBuilder: (_, index) {
        return PrRoundedContainer(
          padding: const EdgeInsets.all(PrSizes.md),
          showBorder: true,
          backgroundColor: isDark ? PrColor.dark : PrColor.light,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ///Row 1
              Row(
                children: [
                  ///1 Icon
                  const Icon(Iconsax.ship),
                  const SizedBox(width: PrSizes.spaceBtwItems / 2),

                  ///2 Status and date
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Processing',
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: PrColor.primary, fontWeightDelta: 1),
                        ),
                        Text('07 Nov 2024',
                            style: Theme.of(context).textTheme.headlineSmall)
                      ],
                    ),
                  ),

                  /// 3 Icon
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Iconsax.arrow_right_34,
                          size: PrSizes.iconSm))
                ],
              ),
              const SizedBox(height: PrSizes.spaceBtwItems),

              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        ///1 Icon
                        const Icon(Iconsax.tag),
                        const SizedBox(width: PrSizes.spaceBtwItems / 2),

                        ///2 Status and date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Order',
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                              Text('[#242342]',
                                  style:
                                      Theme.of(context).textTheme.titleMedium)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        ///1 Icon
                        const Icon(Iconsax.calendar),
                        const SizedBox(width: PrSizes.spaceBtwItems / 2),

                        ///2 Status and date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Shipping Date',
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                              Text('10 Nov 2024',
                                  style:
                                      Theme.of(context).textTheme.titleMedium)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
