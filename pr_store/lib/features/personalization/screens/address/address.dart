import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/features/personalization/controllers/address/address_controller.dart';
import 'package:pr_store/features/personalization/screens/address/add_new_address.dart';
import 'package:pr_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/cloud_helper_functions.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
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
        padding: const EdgeInsets.all(PrSizes.defaultSpace),
        child: FutureBuilder(
            future: controller.getAllUserAddress(),
            builder: (context, snapshot) {
              /// Helper Function,Handel Loader, No record,or Error message
              final response = PrCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
              if (response != null) return response;

              /// User address found
              final addresses = snapshot.data!;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: addresses.length,
                itemBuilder: (_, index) => PrSingleAddress(
                  address: addresses[index],
                  onTap: () => controller.selectAddress(addresses[index]),
                ),
              );
            }),
      ),
    );
  }
}
