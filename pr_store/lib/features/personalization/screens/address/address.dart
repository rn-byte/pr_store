import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/features/personalization/screens/address/add_new_address.dart';
import 'package:pr_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(
          Iconsax.add,
          color: PrColor.white,
        ),
      ),
      appBar: PrAppBar(
        showBackArrow: true,
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(PrSizes.defaultSpace),
        child: Column(
          children: [
            PrSingleAddress(selectedAddress: true),
            PrSingleAddress(selectedAddress: false)
          ],
        ),
      ),
    );
  }
}
