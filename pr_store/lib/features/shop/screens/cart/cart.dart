import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/loaders/animation_loader.dart';
import 'package:pr_store/features/shop/controllers/cart/cart_controller.dart';
import 'package:pr_store/features/shop/screens/checkout/checkout.dart';
import 'package:pr_store/navigation_menu.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Obx(() {
      /// Nothing found Widget
      final emptyWidget = PrAnimationLoaderWidget(
        text: 'Whoops!, Cart is Empty. ',
        animation: PrImage.cartAnimation,
        showAction: true,
        actionText: "Let's Fill it.",
        onActionPressed: () => Get.off(() => const NavigationMenu()),
      );
      return Scaffold(
        appBar: PrAppBar(
          showBackArrow: true,
          title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: controller.cartItems.isEmpty
            ? emptyWidget
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: PrSizes.defaultSpace),

                  /// Items in cart
                  child: PrCartItems(),
                ),
              ),

        /// Checkout button
        bottomNavigationBar: controller.cartItems.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.all(PrSizes.defaultSpace),
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const CheckoutScreen()),
                    child: Obx(() => Text(
                        'Checkout Rs. ${controller.totalCartPrice.value}'))),
              ),
      );
    });
  }
}
