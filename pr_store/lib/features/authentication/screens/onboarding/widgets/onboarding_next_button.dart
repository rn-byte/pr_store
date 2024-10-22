import 'package:flutter/material.dart';
import 'package:pr_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/helpers/helper.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/devices/devices_utility.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = PrHelper.isDarkMode(context);
    return Positioned(
        bottom: PrDeviceUtils.getBottomNavigationBarHeight(),
        right: PrSizes.defaultSpace,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: dark ? PrColor.primary : PrColor.dark),
            onPressed: () => OnboardingController.instance.nextPage(),
            child: const Icon(Icons.arrow_forward_ios)));
  }
}
