import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/icons/pr_circular_icon.dart';
import 'package:pr_store/common/widgets/layouts/grid_layout/grid_layout.dart';
import 'package:pr_store/common/widgets/loaders/animation_loader.dart';
import 'package:pr_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:pr_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:pr_store/features/shop/controllers/favourite/favourite_controller.dart';
import 'package:pr_store/navigation_menu.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/cloud_helper_functions.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;
    return Scaffold(
      appBar: PrAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          PrCircularIcon(
            backgroundColor: Colors.transparent,
            icon: Iconsax.add,
            onPressed: () => Get.offAll(() => const NavigationMenu()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PrSizes.defaultSpace),
          child: Column(
            children: [
              Obx(
                () => FutureBuilder(
                    future: controller.favouriteProducts(),
                    builder: (context, snapshot) {
                      /// nothing found widget
                      final emptyWidget = PrAnimationLoaderWidget(
                        text: 'Woops ! Wishlist is Empty.',
                        animation: PrImage.pencilAnimation,
                        showAction: true,
                        actionText: "Let's add some.",
                        onActionPressed: () => Get.offAll(() => const NavigationMenu()),
                      );

                      const loader = PrVerticalProductShimmer(itemCount: 6);
                      final widget = PrCloudHelperFunctions.checkMultiRecordState(
                          snapshot: snapshot, loader: loader, nothingFound: emptyWidget);

                      if (widget != null) return widget;
                      final products = snapshot.data!;
                      return PrGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) => PrProductCardVertical(
                                product: products[index],
                              ));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
