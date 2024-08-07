import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pr_store/common/widgets/success_screen/success_screen.dart';
import 'package:pr_store/features/authentication/screens/login/login.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/constants/text_strings.dart';
import 'package:pr_store/utils/helpers/helper.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
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
                'pr_online@store.com',
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
                    onPressed: () => Get.to(() => SuccessScreen(
                          image: PrImage.staticSuccessIllustration,
                          onPressed: () => Get.to(() => const LoginScreen()),
                          title: PrText.yourAccountCreatedTitle,
                          subTitle: PrText.yourAccountCreatedSubTitle,
                        )),
                    child: const Text(PrText.tContinue)),
              ),
              const SizedBox(
                height: PrSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {}, child: const Text(PrText.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
