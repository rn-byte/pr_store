import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/images/pr_rounded_image.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrAppBar(
        title: Text('Sports Shirts'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(PrSizes.defaultSpace),
        child: Column(
          children: [
            //Banner
            PrRoundedImage(
                imageUrl: PrImage.promoBanner3,
                width: double.infinity,
                applyImageRadius: true),
            SizedBox(height: PrSizes.spaceBtwSections),

            /// Sub-Categories
          ],
        ),
      ),
    );
  }
}
