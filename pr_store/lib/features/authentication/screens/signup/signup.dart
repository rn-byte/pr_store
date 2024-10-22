import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/features/authentication/screens/login/widgets/widgets.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/constants/text_strings.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PrSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title
              Text(
                PrText.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: PrSizes.spaceBtwSections,
              ),

              ///Form
              const SignupForm(),
              const SizedBox(height: PrSizes.spaceBtwSections),
              //Divider

              PrFormDivider(dividerText: PrText.orsignupwith.capitalize!),
              const SizedBox(height: PrSizes.spaceBtwSections),

              //Social button
              const PrSocialFooter()
            ],
          ),
        ),
      ),
    );
  }
}
