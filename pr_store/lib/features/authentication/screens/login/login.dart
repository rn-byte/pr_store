import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';

import 'package:pr_store/common/styles/spacing_styles.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import 'widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: PrSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///Logo title and subtitle
              const LoginHeader(),
              //Form
              const LoginForm(),
              //Divider
              PrFormDivider(
                dividerText: PrText.orsigninwith.capitalize!,
              ),
              const SizedBox(
                height: PrSizes.spaceBtwItems,
              ),

              ///Footer
              const PrSocialFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
