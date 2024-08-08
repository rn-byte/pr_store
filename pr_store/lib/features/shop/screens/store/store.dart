import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:pr_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return Scaffold(
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
      body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: isDark ? PrColor.black : PrColor.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(PrSizes.defaultSpace),
                  child: ListView(
                    children: const [
                      SizedBox(
                        height: PrSizes.spaceBtwItems,
                      ),
                      PrSearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                      ),
                      SizedBox(
                        height: PrSizes.spaceBtwSections,
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Container()),
    );
  }
}
