import 'package:flutter/material.dart';
import 'package:pr_store/common/styles/spaicing_styles.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';
import 'widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: PrSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///Logo title and subtitle
              LoginHeader(isDark: isDark),
              //Form
              const LoginForm(),
              //Divider
              FormDivider(isDark: isDark),
              const SizedBox(
                height: PrSizes.spaceBtwItems,
              ),

              ///Footer
              const LoginFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
