import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/features/personalization/controllers/address/address_controller.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/validators/validation.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: const PrAppBar(
        showBackArrow: true,
        title: Text('Add new Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PrSizes.defaultSpace),
          child: Form(
              key: controller.addressFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.name,
                    validator: (value) => PrValidator.validateEmptyField('Name', value),
                    decoration:
                        const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
                  ),
                  const SizedBox(
                    height: PrSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.phoneNumber,
                    validator: (value) => PrValidator.validatePhoneNumber(value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.mobile), labelText: 'Phone Number'),
                  ),
                  const SizedBox(
                    height: PrSizes.spaceBtwInputFields,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.street,
                          validator: (value) => PrValidator.validateEmptyField('Street', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.building_31), labelText: 'Street'),
                        ),
                      ),
                      const SizedBox(
                        width: PrSizes.spaceBtwInputFields,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controller.postalCode,
                          validator: (value) =>
                              PrValidator.validateEmptyField('Postal Code', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.code), labelText: 'Postal Code'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: PrSizes.spaceBtwInputFields,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.city,
                          validator: (value) => PrValidator.validateEmptyField('City', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.building), labelText: 'City'),
                        ),
                      ),
                      const SizedBox(
                        width: PrSizes.spaceBtwInputFields,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controller.state,
                          validator: (value) => PrValidator.validateEmptyField('State', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.activity), labelText: 'State'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: PrSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.country,
                    validator: (value) => PrValidator.validateEmptyField('Country', value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                  ),
                  const SizedBox(
                    height: PrSizes.defaultSpace * 2,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => controller.addNewAddress(), child: const Text('Save')),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
