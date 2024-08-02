import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image(
              height: 150,
              image: AssetImage(
                isDark ? PrImage.darkAppLogo : PrImage.lightAppLogo,
              )),
        ),
        Text(PrText.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(
          height: PrSizes.sm,
        ),
        Text(PrText.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
