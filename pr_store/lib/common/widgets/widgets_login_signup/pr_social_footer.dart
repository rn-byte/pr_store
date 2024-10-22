import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/features/authentication/controllers/login/login_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class PrSocialFooter extends StatelessWidget {
  const PrSocialFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: PrColor.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () => controller.googleSignIn(),
              icon: const Image(
                  height: PrSizes.iconMd,
                  width: PrSizes.iconMd,
                  image: AssetImage(PrImage.google))),
        ),
        const SizedBox(
          width: PrSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: PrColor.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                  height: PrSizes.iconMd,
                  width: PrSizes.iconMd,
                  image: AssetImage(PrImage.facebook))),
        ),
      ],
    );
  }
}
