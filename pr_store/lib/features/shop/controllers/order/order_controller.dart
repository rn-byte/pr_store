import 'package:get/get.dart';
import 'package:pr_store/features/personalization/controllers/address/address_controller.dart';
import 'package:pr_store/features/shop/controllers/cart/cart_controller.dart';
import 'package:pr_store/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:pr_store/utils/popups/loaders.dart';

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
}
