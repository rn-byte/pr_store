import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../features/authentication/screens/login/login.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper.dart';
import '../../styles/spaicing_styles.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: PrSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(PrImage.staticSuccessIllustration),
                width: PrHelper.screenWidth() * 0.6,
              ),
              const SizedBox(height: PrSizes.spaceBtwSections),

              /// Title & SubTitle
              Text(PrText.yourAccountCreatedTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: PrSizes.spaceBtwItems),
              Text(PrText.yourAccountCreatedSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: PrSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const LoginScreen()),
                    child: const Text(PrText.tContinue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
