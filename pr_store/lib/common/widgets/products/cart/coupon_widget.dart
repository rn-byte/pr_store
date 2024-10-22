import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';

class PrCouponCode extends StatelessWidget {
  const PrCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = PrHelper.isDarkMode(context);
    return PrRoundedContainer(
      showBorder: true,
      backgroundColor: isDark ? PrColor.dark : PrColor.white,
      padding: const EdgeInsets.only(
          top: PrSizes.sm,
          bottom: PrSizes.sm,
          right: PrSizes.sm,
          left: PrSizes.md),
      child: Row(
        children: [
          /// TextField
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code ? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          ///Button
          SizedBox(
              width: 80,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: isDark
                        ? PrColor.white.withOpacity(0.5)
                        : PrColor.dark.withOpacity(0.5),
                    backgroundColor: PrColor.grey.withOpacity(0.2),
                    side: BorderSide(color: PrColor.grey.withOpacity(0.1))),
                onPressed: () {},
                child: const Text('Apply'),
              ))
        ],
      ),
    );
  }
}
