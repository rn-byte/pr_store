import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/devices/devices_utility.dart';
import '../../../../utils/helpers/helper.dart';

class PrSearchContainer extends StatelessWidget {
  const PrSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.padding = const EdgeInsets.symmetric(horizontal: PrSizes.defaultSpace),
  });
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return Padding(
      padding: padding,
      child: Container(
        width: PrDeviceUtils.getScreenWidth(),
        padding: const EdgeInsets.all(PrSizes.md),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(PrSizes.cardRadiusLg),
          color: showBackground
              ? isDark
                  ? PrColor.dark
                  : PrColor.light
              : Colors.transparent,
          border: showBorder ? Border.all(color: PrColor.grey) : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: PrColor.darkGrey,
            ),
            const SizedBox(
              width: PrSizes.spaceBtwItems,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
