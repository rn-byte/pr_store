import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/images/pr_circular_image.dart';
import 'package:pr_store/common/widgets/texts/section_heading.dart';
import 'package:pr_store/utils/constants/sizes.dart';

import '../../../../utils/constants/image_strings.dart';
import 'widgets/profile_menu.dart';

class PrProfileScreen extends StatelessWidget {
  const PrProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const PrCircularImage(
                      image: PrImage.user,
                      height: 80,
                      width: 80,
                      fit: BoxFit.contain,
                      backgroundColor: Colors.transparent,
                    ),
                    TextButton(
                        onPressed: () {},
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

              PrProfileMenu(title: 'Name', value: 'Pr Store', onPressed: () {}),
              PrProfileMenu(
                  title: 'Username', value: 'pr_store', onPressed: () {}),

              const SizedBox(height: PrSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: PrSizes.spaceBtwItems),

              ///----------Personal Information-----------///
              const PrSectionHeading(
                  title: 'Personal Information', showActionButton: false),

              const SizedBox(
                height: PrSizes.spaceBtwItems,
              ),

              PrProfileMenu(onPressed: () {}, title: 'User ID', value: '2212'),
              PrProfileMenu(
                  onPressed: () {},
                  title: 'Email',
                  value: 'pr_store@gmail.com'),
              PrProfileMenu(
                  onPressed: () {},
                  title: 'Phone Number.',
                  value: '+977 9814858508'),
              PrProfileMenu(
                  onPressed: () {},
                  title: 'Date of Birth',
                  value: '01 Jan 2000'),
              PrProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
            ],
          ),
        ),
      ),
    );
  }
}
