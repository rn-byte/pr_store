import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/constants/text_strings.dart';
import '../../controllers_onboarding/onboarding_controller.dart';
import 'widgets/widgets.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          ///Horizontal scroolable page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                  image: PrImage.onBoardingImage1,
                  title: PrText.onBoardingTitle1,
                  subTitle: PrText.onBoardingSubTitle1),
              OnBoardingPage(
                  image: PrImage.onBoardingImage2,
                  title: PrText.onBoardingTitle2,
                  subTitle: PrText.onBoardingSubTitle2),
              OnBoardingPage(
                  image: PrImage.onBoardingImage3,
                  title: PrText.onBoardingTitle3,
                  subTitle: PrText.onBoardingSubTitle3),
            ],
          ),

          ///skip button
          const OnBoardingSkip(),

          ///Dot Navigation SmoothPageIndicator
          const OnBoardingNavigation(),

          ///circular button
          const OnboardingNextButton()
        ],
      ),
    );
  }
}
