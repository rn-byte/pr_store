import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/images/pr_circular_image.dart';
import 'package:pr_store/common/widgets/shimmers/shimmer.dart';
import 'package:pr_store/common/widgets/texts/section_heading.dart';
import 'package:pr_store/features/personalization/controllers/user/user_controller.dart';
import 'package:pr_store/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:pr_store/utils/constants/sizes.dart';

import '../../../../utils/constants/image_strings.dart';
import 'widgets/profile_menu.dart';

class PrProfileScreen extends StatelessWidget {
  const PrProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: PrAppBar(
        title:
            Text('Profile', style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),

      ///Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PrSizes.defaultSpace),
          child: Column(
            children: [
              ///----Profile Picture-------///
              Center(
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : PrImage.user;
                      return controller.imageUploading.value
                          ? const PrShimmerEffect(
                              width: 80, height: 80, radius: 80)
                          : PrCircularImage(
                              image: image,
                              height: 80,
                              width: 80,
                              fit: BoxFit.contain,
                              backgroundColor: Colors.transparent,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: Text('Change Profile Picture',
                            style: Theme.of(context).textTheme.labelLarge))
                  ],
                ),
              ),
              //Details
              const SizedBox(
                height: PrSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: PrSizes.spaceBtwItems,
              ),

              ///------Heading Profile INFO---------///
              const PrSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: PrSizes.spaceBtwItems),

              PrProfileMenu(
                  title: 'Name',
                  value: controller.user.value.fullName,
                  onPressed: () => Get.to(() => const ChangeName())),

              PrProfileMenu(
                  title: 'Username',
                  value: controller.user.value.userName,
                  onPressed: () {}),

              const SizedBox(height: PrSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: PrSizes.spaceBtwItems),

              ///----------Personal Information-----------///
              const PrSectionHeading(
                  title: 'Personal Information', showActionButton: false),

              const SizedBox(
                height: PrSizes.spaceBtwItems,
              ),

              PrProfileMenu(
                onPressed: () {},
                title: 'User ID',
                value: controller.user.value.id,
                icon: Iconsax.copy,
              ),
              PrProfileMenu(
                  onPressed: () {},
                  title: 'Email',
                  value: controller.user.value.email),
              PrProfileMenu(
                  onPressed: () {},
                  title: 'Phone Number',
                  value: controller.user.value.phoneNumber),
              PrProfileMenu(
                  onPressed: () {},
                  title: 'Date of Birth',
                  value: '01 Jan 2000'),
              PrProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              const SizedBox(
                height: PrSizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(
                height: PrSizes.spaceBtwSections,
              ),
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: Text('Close Account',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.red)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
