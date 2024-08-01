import 'package:flutter/material.dart';
import 'package:pr_store/features/authentication/controllers_onboarding/onboarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/devices/devices_utility.dart';
import '../../../../../utils/helpers/helper.dart';

class OnBoardingNavigation extends StatelessWidget {
  const OnBoardingNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    final dark = PrHelper.isDarkMode(context);
    return Positioned(
      bottom: PrDeviceUtils.getBottomNavigationBarHeight() + 20,
      left: PrSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? PrColor.light : PrColor.dark,
          dotHeight: 6,
        ),
      ),
    );
  }
}
