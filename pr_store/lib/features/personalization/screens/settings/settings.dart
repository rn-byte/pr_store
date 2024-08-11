import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Heading

            PrPrimaryHeaderConatiner(
                child: Column(
              children: [
                PrAppBar(
                  title: Text('Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: PrColor.white)),
                ),
                const SizedBox(height: PrSizes.spaceBtwSections),
              ],
            ))

            ///Body
          ],
        ),
      ),
    );
  }
}
