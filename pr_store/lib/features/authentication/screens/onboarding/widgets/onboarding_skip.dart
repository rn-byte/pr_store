import 'package:flutter/material.dart';
import 'package:pr_store/features/authentication/controllers_onboarding/onboarding_controller.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/devices/devices_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: PrDeviceUtils.getAppBarHeight(),
      right: PrSizes.defaultSpace,
      child: TextButton(
          onPressed: () => OnboardingController.instance.skipPage(),
          child: const Text(
            'Skip',
          )),
    );
  }
}
