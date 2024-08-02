import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
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
