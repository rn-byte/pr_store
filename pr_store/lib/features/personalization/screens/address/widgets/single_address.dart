import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pr_store/features/authentication/models/address_model.dart';
import 'package:pr_store/features/personalization/controllers/address/address_controller.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';

class PrSingleAddress extends StatelessWidget {
  const PrSingleAddress({
    super.key,
    required this.address,
    required this.onTap,
  });
  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final isDark = PrHelper.isDarkMode(context);

    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressId == address.id;
      return InkWell(
        onTap: onTap,
        child: PrRoundedContainer(
          padding: const EdgeInsets.all(PrSizes.md),
          width: double.infinity,
          showBorder: true,
          backgroundColor: selectedAddress ? PrColor.primary.withOpacity(0.5) : Colors.transparent,
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
                top: 16,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PR Store',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: PrSizes.sm / 2,
                  ),
                  const Text(
                    '+977 9807805496',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: PrSizes.sm / 2,
                  ),
                  const Text(
                    '4480 Kumaripati-20, Purnachandi, Lalitpur, Nepal',
                    softWrap: true,
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
