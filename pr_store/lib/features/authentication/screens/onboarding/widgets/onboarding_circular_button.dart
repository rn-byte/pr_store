import 'package:flutter/material.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/helpers/helper.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/devices/devices_utility.dart';

class OnBoardingCircularButton extends StatelessWidget {
  const OnBoardingCircularButton({
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
            onPressed: () {},
            child: const Icon(Icons.arrow_forward_ios)));
  }
}
