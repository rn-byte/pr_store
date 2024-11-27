import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/features/personalization/controllers/address/address_controller.dart';
import 'package:pr_store/features/shop/controllers/cart/cart_controller.dart';
import 'package:pr_store/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:pr_store/navigation_menu.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/popups/full_screen_loader.dart';
import 'package:pr_store/utils/popups/loaders.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/order/order_repository.dart';
import '../../../../utils/constants/enum.dart';
import '../../models/order_model.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  /// Fetch User's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      PrLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Add method for order processing
  void processOrder(double totalAmount) async {
    try {
      /// Start Loader
      PrFullScreenLoader.openLoadingDialog(
          'Processing your order', PrImage.pencilAnimation);

      /// Get user authentication Id
      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty) return;

      /// Add Details
      final order = OrderModel(
        /// Generate a unique ID for the order
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,

        /// Set Date as needed
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      /// Save the order to Firestore
      await orderRepository.saveOrder(order, userId);

      /// Update the cart status
      cartController.clearCart();

      /// Show Success screen
      Get.off(() => SuccessScreen(
            image: PrImage.orderCompletedAnimation,
            title: 'Payment Success!',
            subTitle: 'Your Item will be shipped soon !',
            onPressed: () => Get.offAll(() => const NavigationMenu()),
          ));
    } catch (e) {
      PrLoaders.errorSnackBar(title: 'Oh Snap !', message: e.toString());
    }
  }
}
