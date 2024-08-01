import 'package:flutter/material.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/constants/text_strings.dart';
import 'package:pr_store/utils/helpers/helper.dart';

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
          )

          ///skip button
          ///Dot Navigation SmoothPageIndicator
          ///circular button
        ],
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image, title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PrSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            height: PrHelper.screenHeight() * 0.6,
            width: PrHelper.screenWidth() * 0.8,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: PrSizes.spaceBtwItems,
          ),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
