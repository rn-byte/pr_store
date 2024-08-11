import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';

import '../../../../common/widgets/layouts/list_tile/user_profile_tile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header

            PrPrimaryHeaderConatiner(
                child: Column(
              children: [
                ///AppBar
                PrAppBar(
                  title: Text('Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: PrColor.white)),
                ),
                const SizedBox(height: PrSizes.spaceBtwSections),

                ///User Profile Card
                const PrProfileUserTile(),

                const SizedBox(
                  height: PrSizes.spaceBtwSections,
                ),
              ],
            ))

            ///Body
          ],
        ),
      ),
    );
  }
}
