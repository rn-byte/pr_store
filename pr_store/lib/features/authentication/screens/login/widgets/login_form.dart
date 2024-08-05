import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:pr_store/features/authentication/screens/signup/signup.dart';
import 'package:pr_store/navigation_menu.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: PrSizes.spaceBtwSections),
        child: Column(
          children: [
            //Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: PrText.email,
              ),
            ),
            const SizedBox(
              height: PrSizes.spaceBtwInputFields,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: PrText.password,
                suffixIcon: Icon(
                  Iconsax.eye_slash,
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
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
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
                onPressed: () => Get.to(() => const NavigationMenu()),
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
