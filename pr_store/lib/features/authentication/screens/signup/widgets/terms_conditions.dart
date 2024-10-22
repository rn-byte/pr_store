import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/features/authentication/controllers/signup/signup_controller.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper.dart';

class PrTermsAndCondition extends StatelessWidget {
  const PrTermsAndCondition({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Obx(() => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) {
                controller.privacyPolicy.value =
                    !controller.privacyPolicy.value;
              })),
        ),
        const SizedBox(width: PrSizes.spaceBtwItems),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${PrText.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: PrText.privacyPolicy,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: isDark ? PrColor.white : PrColor.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: isDark ? PrColor.white : PrColor.primary)),
          TextSpan(
              text: ' ${PrText.and} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: PrText.termsOfUse,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: isDark ? PrColor.white : PrColor.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: isDark ? PrColor.white : PrColor.primary)),
        ]))
      ],
    );
  }
}
