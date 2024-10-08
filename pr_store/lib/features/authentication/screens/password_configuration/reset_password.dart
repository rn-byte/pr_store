import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pr_store/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:pr_store/features/authentication/screens/login/login.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';
import '../../../../utils/constants/text_strings.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                CupertinoIcons.clear,
                color: isDark ? PrColor.light : PrColor.dark,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PrSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(PrImage.deliveredEmailIllustration),
                width: PrHelper.screenWidth() * 0.6,
              ),
              const SizedBox(height: PrSizes.spaceBtwSections),

              /// Title & SubTitle
              Text(email,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: PrSizes.spaceBtwItems),
              Text(PrText.changeYourPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: PrSizes.spaceBtwItems),
              Text(PrText.changeYourPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: PrSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.offAll(() => const LoginScreen()),
                    child: const Text(PrText.done)),
              ),
              const SizedBox(height: PrSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => ForgotPasswordController.instance
                      .resendPasswordRestEmail(email),
                  child: const Text(PrText.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
