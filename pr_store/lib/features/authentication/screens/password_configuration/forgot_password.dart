import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/constants/text_strings.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(PrSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Heading
            Text(PrText.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(
              height: PrSizes.spaceBtwItems,
            ),
            Text(PrText.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(
              height: PrSizes.spaceBtwSections * 2,
            ),

            ///TExtField
            TextFormField(
              decoration: const InputDecoration(
                  labelText: PrText.email,
                  prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(
              height: PrSizes.spaceBtwSections,
            ),

            ///Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.to(() => const ResetPassword()),
                  child: const Text(PrText.submit)),
            )
          ],
        ),
      ),
    );
  }
}
