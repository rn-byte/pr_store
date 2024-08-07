import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class PrAddToCartButton extends StatelessWidget {
  const PrAddToCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: PrColor.black,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(PrSizes.cardRadiusMd),
            bottomRight: Radius.circular(PrSizes.productImageRadius)),
      ),
      child: const SizedBox(
        height: PrSizes.iconLg * 1.2,
        width: PrSizes.iconLg * 1.2,
        child: Center(
          child: Icon(
            Iconsax.add,
            color: PrColor.white,
          ),
        ),
      ),
    );
  }
}
