import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/features/authentication/screens/login/widgets/widgets.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/constants/text_strings.dart';
import 'package:pr_store/utils/helpers/helper.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
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
              Form(
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
                        labelText: PrText.email,
                        prefixIcon: Icon(Iconsax.direct)),
                  ),
                  const SizedBox(
                    height: PrSizes.spaceBtwInputFields,
                  ),

                  //Phone Number
                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: PrText.phoneNa,
                        prefixIcon: Icon(Iconsax.call)),
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
                  Row(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(value: true, onChanged: (value) {}),
                      ),
                      const SizedBox(width: PrSizes.spaceBtwItems),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: '${PrText.iAgreeTo} ',
                            style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(
                            text: PrText.privacyPolicy,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(
                                    color: isDark
                                        ? PrColor.white
                                        : PrColor.primary,
                                    decoration: TextDecoration.underline,
                                    decorationColor: isDark
                                        ? PrColor.white
                                        : PrColor.primary)),
                        TextSpan(
                            text: ' ${PrText.and} ',
                            style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(
                            text: PrText.termsOfUse,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(
                                    color: isDark
                                        ? PrColor.white
                                        : PrColor.primary,
                                    decoration: TextDecoration.underline,
                                    decorationColor: isDark
                                        ? PrColor.white
                                        : PrColor.primary)),
                      ]))
                    ],
                  ),

                  const SizedBox(height: PrSizes.spaceBtwSections),

                  ///SignUp Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(PrText.createAccount)),
                  ),
                  const SizedBox(height: PrSizes.spaceBtwSections),
                  //Divider

                  PrFormDivider(dividerText: PrText.orsignupwith.capitalize!),
                  const SizedBox(height: PrSizes.spaceBtwSections),

                  //Social button
                  const PrSocialFooter()
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
