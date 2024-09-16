import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/features/personalization/controllers/profile/update_name_controller.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/constants/text_strings.dart';
import 'package:pr_store/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UpdateNameController.instance;
    return Scaffold(
      /// Custom AppBar
      appBar: PrAppBar(
        showBackArrow: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(PrSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            Text(
              'Use real name for easy verification. This name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: PrSizes.spaceBtwSections),

            /// TextField and Button
            Form(
              key: controller.updateUserNameFromKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        PrValidator.validateEmptyField('First Name', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: PrText.firstName,
                      prefixIcon: Icon(
                        Iconsax.user,
                      ),
                    ),
                  ),
                  const SizedBox(height: PrSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        PrValidator.validateEmptyField('Last Name', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: PrText.firstName,
                      prefixIcon: Icon(
                        Iconsax.user,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: PrSizes.spaceBtwSections,
            ),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.updateUserName(),
                  child: const Text('Save')),
            )
          ],
        ),
      ),
    );
  }
}
