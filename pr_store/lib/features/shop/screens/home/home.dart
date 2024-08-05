import 'package:flutter/material.dart';
import 'package:pr_store/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import 'widgets/home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrPrimaryHeaderConatiner(
              child: Column(
                children: [
                  ///AppBar
                  PrHomeAppBar(),
                  SizedBox(
                    height: PrSizes.spaceBtwSections,
                  ),

                  ///Search Bar

                  PrSearchContainer(text: 'Search in store'),
                  SizedBox(
                    height: PrSizes.spaceBtwSections,
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: PrSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// Heading
                        PrSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: PrColor.light,
                        ),
                        SizedBox(
                          height: PrSizes.spaceBtwItems,
                        ),

                        /// categories section
                        PrHomeCategories(),
                      ],
                    ),
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
