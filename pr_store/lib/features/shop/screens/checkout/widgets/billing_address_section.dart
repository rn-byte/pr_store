import 'package:flutter/material.dart';
import 'package:pr_store/features/personalization/controllers/address/address_controller.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class PrBillingAddressSection extends StatelessWidget {
  const PrBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    //final isDark = PrHelper.isDarkMode(context);
    final controller = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrSectionHeading(
            title: 'Shipping Address',
            buttonTitle: 'Change',
            onPressed: () => controller.selectNewAddressPopup(context)),
        const SizedBox(height: PrSizes.spaceBtwItems / 2),
        Text(
          'Pr Store',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: PrSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: PrColor.grey, size: 16),
            const SizedBox(width: PrSizes.spaceBtwItems),
            Text('+977 9823212123',
                style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(height: PrSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: PrColor.grey, size: 16),
            const SizedBox(width: PrSizes.spaceBtwItems),
            Expanded(
              child: Text(
                'Purnachandi - 20, Kumaripati, Lalitpur, Nepal',
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            )
          ],
        ),
      ],
    );
  }
}
