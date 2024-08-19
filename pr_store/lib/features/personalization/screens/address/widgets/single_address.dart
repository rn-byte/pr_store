import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';

class PrSingleAddress extends StatelessWidget {
  const PrSingleAddress({super.key, required this.selectedAddress});
  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return PrRoundedContainer(
      padding: const EdgeInsets.all(PrSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? PrColor.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : isDark
              ? PrColor.darkerGrey
              : PrColor.grey,
      margin: const EdgeInsets.only(bottom: PrSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? isDark
                      ? PrColor.light
                      : PrColor.dark
                  : null,
            ),
          ),
          Column(
            children: [
              Text(
                '4480 Kumaripati-20, Purnachandi, Lalitpur, Nepal',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: PrSizes.sm / 2,
              )
            ],
          )
        ],
      ),
    );
  }
}