import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:pr_store/utils/validators/valdations.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import 'terms_conditions.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              //first name
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  expands: false,
                  validator: (value) =>
                      PrValidator.validateEmptyField('First Name', value),
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
                  controller: controller.lastName,
                  expands: false,
                  validator: (value) =>
                      PrValidator.validateEmptyField('Last Name', value),
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
            controller: controller.userName,
            expands: false,
            validator: (value) =>
                PrValidator.validateEmptyField('Username', value),
            decoration: const InputDecoration(
                labelText: PrText.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(
            height: PrSizes.spaceBtwInputFields,
          ),

          //Email
          TextFormField(
            controller: controller.email,
            expands: false,
            validator: (value) => PrValidator.validateEmail(value),
            decoration: const InputDecoration(
                labelText: PrText.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(
            height: PrSizes.spaceBtwInputFields,
          ),

          //Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            expands: false,
            validator: (value) => PrValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
                labelText: PrText.phoneNa, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(
            height: PrSizes.spaceBtwInputFields,
          ),

          //Password
          TextFormField(
            controller: controller.password,
            expands: false,
            validator: (value) => PrValidator.validatePassword(value),
            decoration: const InputDecoration(
                labelText: PrText.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash)),
          ),
          const SizedBox(height: PrSizes.spaceBtwSections),

          ///Terms ans condition checkBox
          const PrTermsAndCondition(),

          const SizedBox(height: PrSizes.spaceBtwSections),

          ///SignUp Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.signup,
                child: const Text(PrText.createAccount)),
          ),
        ],
      ),
    );
  }
}
