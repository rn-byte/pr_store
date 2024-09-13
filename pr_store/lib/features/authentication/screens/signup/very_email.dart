import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pr_store/data/repositories/authentication/authentication_repository.dart';
import 'package:pr_store/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/constants/text_strings.dart';
import 'package:pr_store/utils/helpers/helper.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      /// The close icon in the appBar is used to log out the user and redirect them to login screen
      /// This approach is taken to handel scenarios where the user enters the registration process
      /// and data is stored. upon reopening the app, it check if email is verifired or not.
      /// if email is not verified the app always navigate to verification screen

      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: Icon(
                CupertinoIcons.clear,
                color: isDark ? PrColor.light : PrColor.dark,
              ))
        ],
        systemOverlayStyle:
            isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            PrSizes.defaultSpace,
          ),
          child: Column(
            children: [
              ///Image
              Image(
                  width: PrHelper.screenWidth() * 0.6,
                  image: const AssetImage(PrImage.deliveredEmailIllustration)),
              const SizedBox(
                height: PrSizes.spaceBtwSections,
              ),

              ///Title & Subtitle
              Text(
                PrText.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: PrSizes.spaceBtwItems,
              ),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: PrSizes.spaceBtwItems,
              ),
              Text(
                PrText.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: PrSizes.spaceBtwSections,
              ),

              ///Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.checkEmailVerificationStatus(),
                    child: const Text(PrText.tContinue)),
              ),
              const SizedBox(
                height: PrSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => controller.sendEmailVerification(),
                    child: const Text(PrText.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
