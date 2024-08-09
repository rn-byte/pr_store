import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/app_bar/tabbar.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:pr_store/common/widgets/layouts/grid_layout.dart';
import 'package:pr_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:pr_store/common/widgets/texts/section_heading.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';
import 'widgets/brand_card_widget.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        /// AppBar
        appBar: PrAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            PrCartCounterIcon(
              iconColor: isDark ? PrColor.white : PrColor.black,
              onPressed: () {},
            ),
          ],
        ),

        ///HEader
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: Colors.transparent,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(PrSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ///Search Bar
                        const SizedBox(
                          height: PrSizes.spaceBtwItems,
                        ),
                        const PrSearchContainer(
                          text: 'Search in Store',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(
                          height: PrSizes.spaceBtwSections,
                        ),

                        ///Featured Brands
                        PrSectionHeading(
                          title: 'Featured Brands',
                          onPressed: () {},
                        ),
                        const SizedBox(
                          height: PrSizes.spaceBtwItems / 1.5,
                        ),

                        ///BRand Grid Layout
                        PrGridLayout(
                            itemCount: 4,
                            mainAxisCount: 80,
                            itemBuilder: (_, index) {
                              //In backend part we will pass each brans and onPressed event
                              return const PrBrandCard(
                                showBorder: false,
                              );
                            }),
                      ],
                    ),
                  ),

                  ///---------------Tabs--------------------------------///
                  bottom: const PrTabBar(tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furnitures')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Cosmetics')),
                  ]),
                ),
              ];
            },
            body: Container()),
      ),
    );
  }
}
