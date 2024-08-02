import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/common/styles/spaicing_styles.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/constants/text_strings.dart';
import 'package:pr_store/utils/helpers/helper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: PrSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///Logo title and subtitle
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image(
                        height: 150,
                        image: AssetImage(
                          isDark ? PrImage.darkAppLogo : PrImage.lightAppLogo,
                        )),
                  ),
                  Text(PrText.loginTitle,
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(
                    height: PrSizes.sm,
                  ),
                  Text(PrText.loginSubTitle,
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              //Form
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: PrSizes.spaceBtwSections),
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
                              onPressed: () {},
                              child: const Text(PrText.forgetPassword))
                        ],
                      ),
                      const SizedBox(
                        height: PrSizes.spaceBtwItems,
                      ),
                      //Sign button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
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
                          onPressed: () {},
                          child: const Text(PrText.createAccount),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Divider(
                        color: isDark ? PrColor.darkGrey : PrColor.grey,
                        thickness: 0.5,
                        indent: 60,
                        endIndent: 5),
                  ),
                  Text(
                    PrText.orsigninwith.capitalize!,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Flexible(
                    child: Divider(
                        color: isDark ? PrColor.darkGrey : PrColor.grey,
                        thickness: 0.5,
                        indent: 5,
                        endIndent: 60),
                  ),
                ],
              ),
              const SizedBox(
                height: PrSizes.spaceBtwItems,
              ),

              ///Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: PrColor.grey),
                        borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Image(
                            height: PrSizes.iconMd,
                            width: PrSizes.iconMd,
                            image: AssetImage(PrImage.google))),
                  ),
                  const SizedBox(
                    width: PrSizes.spaceBtwItems,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: PrColor.grey),
                        borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Image(
                            height: PrSizes.iconMd,
                            width: PrSizes.iconMd,
                            image: AssetImage(PrImage.facebook))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
