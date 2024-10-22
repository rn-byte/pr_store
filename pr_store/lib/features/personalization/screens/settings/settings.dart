import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:pr_store/common/widgets/layouts/list_tile/settings_menu_tile.dart';
import 'package:pr_store/common/widgets/texts/section_heading.dart';
import 'package:pr_store/data/repositories/authentication/authentication_repository.dart';
import 'package:pr_store/features/personalization/screens/address/address.dart';
import 'package:pr_store/features/personalization/screens/profile/profile.dart';
import 'package:pr_store/features/shop/screens/order/order.dart';
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

            PrPrimaryHeaderContainer(
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
                  //const SizedBox(height: PrSizes.spaceBtwItems),

                  ///User Profile Card
                  PrProfileUserTile(
                    onPressed: () => Get.to(() => const PrProfileScreen()),
                  ),

                  const SizedBox(
                    height: PrSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            ///Body
            Padding(
              padding: const EdgeInsets.all(PrSizes.defaultSpace),
              child: Column(
                children: [
                  const PrSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: PrSizes.spaceBtwItems,
                  ),
                  PrSettingsMenuTile(
                      onTap: () => Get.to(() => const UserAddressScreen()),
                      icon: Iconsax.safe_home,
                      title: 'My Address ',
                      subTitle: 'Set Shopping Delivery Address'),
                  const PrSettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart ',
                      subTitle: 'Add , remove product and move to Checkout'),
                  PrSettingsMenuTile(
                      onTap: () => Get.to(() => const OrderScreen()),
                      icon: Iconsax.bag_tick,
                      title: 'My Orders ',
                      subTitle: 'In-progress and complete orders'),
                  const PrSettingsMenuTile(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subTitle: 'Withdraw balance to registered bank account'),
                  const PrSettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons ',
                      subTitle: 'List of all the discounted coupons'),
                  const PrSettingsMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subTitle: 'Set any kind of notification message'),
                  const PrSettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy ',
                      subTitle: 'Manage data usage and connected account'),

                  ///App Settings
                  const SizedBox(
                    height: PrSizes.spaceBtwSections,
                  ),
                  const PrSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: PrSizes.spaceBtwItems,
                  ),
                  const PrSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subTitle: 'Upload Data to your cloud Firebase'),
                  PrSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  PrSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search Result is safe for all ages',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  PrSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set Image Quality to be seen',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),

                  ///Logout Button
                  const SizedBox(
                    height: PrSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () =>
                            AuthenticationRepository.instance.logout(),
                        child: const Text("Logout")),
                  ),
                  const SizedBox(
                    height: PrSizes.spaceBtwSections * 2.5,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
