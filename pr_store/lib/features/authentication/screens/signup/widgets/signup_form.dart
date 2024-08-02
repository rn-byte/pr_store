import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper.dart';
import 'terms_conditions.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              //first name
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: PrText.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(
                width: PrSizes.spaceBtwInputFields,
              ),
              //last name
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: PrText.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: PrSizes.spaceBtwInputFields,
          ),

          //username
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: PrText.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(
            height: PrSizes.spaceBtwInputFields,
          ),

          //Email
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: PrText.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(
            height: PrSizes.spaceBtwInputFields,
          ),

          //Phone Number
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: PrText.phoneNa, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(
            height: PrSizes.spaceBtwInputFields,
          ),

          //Password
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: PrText.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash)),
          ),
          const SizedBox(height: PrSizes.spaceBtwSections),

          ///Terms ans codition checkBox
          const PrTermsAndCondition(),

          const SizedBox(height: PrSizes.spaceBtwSections),

          ///SignUp Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {}, child: const Text(PrText.createAccount)),
          ),
        ],
      ),
    );
  }
}
