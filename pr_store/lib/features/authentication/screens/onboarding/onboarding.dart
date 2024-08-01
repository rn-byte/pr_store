import 'package:flutter/material.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/constants/text_strings.dart';
import 'package:pr_store/utils/devices/devices_utility.dart';
import 'package:pr_store/utils/helpers/helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'widgets/onboarding_navigation.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ///Horizontal scroolable page
          PageView(
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
        ],
      ),
    );
  }
}
