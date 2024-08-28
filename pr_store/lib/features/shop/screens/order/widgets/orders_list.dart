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
    return PrRoundedContainer(
      showBorder: true,
      backgroundColor: isDark ? PrColor.dark : PrColor.light,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ///Row 1
          Row(
            children: [
              ///1 Icon
              Icon(Iconsax.ship),
              SizedBox(width: PrSizes.spaceBtwItems / 2),

              /// Status and date
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Processing',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: PrColor.primary, fontWeightDelta: 1),
                  ),
                  Text('07 Nov 2024',
                      style: Theme.of(context).textTheme.headlineSmall)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
