import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pr_store/common/widgets/texts/section_heading.dart';
import 'package:pr_store/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';

class PrBillingPaymentSection extends StatelessWidget {
  const PrBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    final isDark = PrHelper.isDarkMode(context);

    return Column(
      children: [
        PrSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () => controller.selectPaymentMethod(context),
        ),
        const SizedBox(height: PrSizes.spaceBtwItems / 2),
        Row(
          children: [
            PrRoundedContainer(
              height: 35,
              width: 60,
              backgroundColor: isDark ? PrColor.light : Colors.transparent,
              padding: const EdgeInsets.all(PrSizes.sm),
              child: const Image(
                image: AssetImage(PrImage.khalti),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: PrSizes.spaceBtwItems),
            Text('Khalti', style: Theme.of(context).textTheme.bodyLarge)
          ],
        )
      ],
    );
  }
}
