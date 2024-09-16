import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/features/personalization/controllers/user/user_controller.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/constants/text_strings.dart';
import 'package:pr_store/utils/validators/validation.dart';

class ReAuthUserLoginForm extends StatelessWidget {
  const ReAuthUserLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Re-Authenticate User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PrSizes.defaultSpace),
          child: Form(
              key: controller.reAuthFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Email
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: PrValidator.validateEmail,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: PrText.email),
                  ),
                  const SizedBox(height: PrSizes.spaceBtwInputFields),
                  Obx(
                    () => TextFormField(
                      obscureText: controller.hidePassword.value,
                      controller: controller.verifyPassword,
                      validator: (value) =>
                          PrValidator.validateEmptyField('Password', value),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check),
                        labelText: PrText.password,
                        suffixIcon: IconButton(
                            onPressed: () => controller.hidePassword.value =
                                !controller.hidePassword.value,
                            icon: Icon(controller.hidePassword.value
                                ? Iconsax.eye
                                : Iconsax.eye_slash)),
                      ),
                    ),
                  ),
                  const SizedBox(height: PrSizes.spaceBtwSections),

                  /// Verify Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => controller.reAuthEmailAndPassUser(),
                        child: const Text('Verify')),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
