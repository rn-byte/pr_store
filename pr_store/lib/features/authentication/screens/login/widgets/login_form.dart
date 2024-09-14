import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/features/authentication/controllers/login/login_controller.dart';
import 'package:pr_store/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:pr_store/features/authentication/screens/signup/signup.dart';
import 'package:pr_store/utils/validators/validation.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: PrSizes.spaceBtwSections),
        child: Column(
          children: [
            //Email
            TextFormField(
              controller: controller.email,
              validator: (value) => PrValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: PrText.email,
              ),
            ),
            const SizedBox(
              height: PrSizes.spaceBtwInputFields,
            ),
            Obx(
              () => TextFormField(
                controller: controller.password,
                expands: false,
                validator: (value) =>
                    PrValidator.validateEmptyField('Password', value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: PrText.password,
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(
                      controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: PrSizes.spaceBtwInputFields / 2,
            ),

            ///Remember me and forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Remember me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value,
                      ),
                    ),
                    const Text(PrText.rememberMe),
                  ],
                ),
                //Forgot Password
                TextButton(
                  onPressed: () => Get.to(() => const ForgotPassword()),
                  child: const Text(PrText.forgetPassword),
                )
              ],
            ),
            const SizedBox(
              height: PrSizes.spaceBtwItems,
            ),
            //Sign button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignin(),
                child: const Text(PrText.signin),
              ),
            ),
            const SizedBox(
              height: PrSizes.spaceBtwItems,
            ),
            //create account button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(PrText.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
