import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:pr_store/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import 'widgets/home_categories.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Home Screen Header
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

            ///Body
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: PrSizes.defaultSpace * 0.4),
              child: PrPromoSlider(banners: [
                PrImage.promoBanner1,
                PrImage.promoBanner2,
                PrImage.promoBanner3
              ]),
            ),
            SizedBox(
              height: PrSizes.spaceBtwItems,
            ),

            ///-------------POPULAR PRODUCTS------------------///
            PrProductCardVertical()
          ],
        ),
      ),
    );
  }
}
