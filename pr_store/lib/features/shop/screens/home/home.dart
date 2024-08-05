import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/features/shop/screens/home/home_app_bar.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/devices/devices_utility.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrPrimaryHeaderConatiner(
              child: Column(
                children: [
                  ///AppBar
                  const PrHomeAppBar(),
                  const SizedBox(
                    height: PrSizes.spaceBtwSections,
                  ),

                  ///Search Bar

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: PrSizes.defaultSpace),
                    child: Container(
                      width: PrDeviceUtils.getScreenWidth(),
                      padding: const EdgeInsets.all(PrSizes.md),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(PrSizes.cardRadiusLg),
                        color: PrColor.white,
                        border: Border.all(color: PrColor.grey),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Iconsax.search_normal,
                            color: PrColor.darkGrey,
                          ),
                          const SizedBox(
                            width: PrSizes.spaceBtwItems,
                          ),
                          Text(
                            'Search in store',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  )

                  /// categories section
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
