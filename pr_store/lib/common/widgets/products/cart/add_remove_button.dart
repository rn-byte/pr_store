import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/common/widgets/icons/pr_circular_icon.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import '../../../../utils/helpers/helper.dart';

class PrProductQuantityWithAddRemoveButton extends StatelessWidget {
  const PrProductQuantityWithAddRemoveButton({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PrCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: PrSizes.md,
          color: isDark ? PrColor.white : PrColor.black,
          backgroundColor: isDark ? PrColor.darkerGrey : PrColor.light,
          onPressed: remove,
        ),
        const SizedBox(width: PrSizes.spaceBtwItems),
        Text(quantity.toString(),
            style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: PrSizes.spaceBtwItems),
        PrCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: PrSizes.md,
          color: PrColor.white,
          backgroundColor: PrColor.primary,
          onPressed: add,
        ),
      ],
    );
  }
}
