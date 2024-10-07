import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/app_bar/tabbar.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:pr_store/common/widgets/layouts/grid_layout/grid_layout.dart';
import 'package:pr_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:pr_store/common/widgets/texts/section_heading.dart';
import 'package:pr_store/features/shop/controllers/brand/brand_controller.dart';
import 'package:pr_store/features/shop/controllers/category/category_controller.dart';
import 'package:pr_store/features/shop/models/product_model.dart';
import 'package:pr_store/features/shop/screens/brand/all_brands.dart';
import 'package:pr_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';
import '../../../../common/widgets/brands/brand_card_widget.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    final categories = CategoryController.instance.featuredCategories;
    final brandController = Get.put(BrandController());
    return DefaultTabController(
      length: categories.length,
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
                expandedHeight: 430,
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
                        onPressed: () => Get.to(() => AllBrandsScreen(
                              product: ProductModel.empty(),
                            )),
                      ),
                      const SizedBox(
                        height: PrSizes.spaceBtwItems / 1.5,
                      ),

                      ///Brand Grid Layout
                      Obx(() {
                        return PrGridLayout(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              //In backend part we will pass each brans and onPressed event
                              return const PrBrandCard(showBorder: true);
                            });
                      }),
                    ],
                  ),
                ),

                ///---------------Tabs--------------------------------///
                bottom: PrTabBar(
                    tabs: categories.map((category) => Tab(child: Text(category.name))).toList()),
                // [
                //   Tab(child: Text('Sports')),
                //   Tab(child: Text('Furniture')),
                //   Tab(child: Text('Electronics')),
                //   Tab(child: Text('Clothes')),
                //   Tab(child: Text('Cosmetics')),
                // ]
                //),
              ),
            ];
          },

          ///----------Body-------///
          body: TabBarView(
              children: categories.map((category) => PrCategoryTab(category: category)).toList()),
          // [
          //   PrCategoryTab(),
          //   PrCategoryTab(),
          //   PrCategoryTab(),
          //   PrCategoryTab(),
          //   PrCategoryTab(),
          // ]),
        ),
      ),
    );
  }
}
