import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/images/pr_circular_image.dart';
import 'package:pr_store/utils/constants/sizes.dart';

import '../../../../utils/constants/image_strings.dart';

class PrProfileScreen extends StatelessWidget {
  const PrProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrAppBar(
        title: Text('Profile'),
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
                        child: const Text('Change Profile Picture'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
