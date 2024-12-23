import 'package:get/get.dart';
import 'package:pr_store/features/personalization/controllers/address/address_controller.dart';
import 'package:pr_store/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:pr_store/features/shop/controllers/product/variations_controller.dart';
import 'package:pr_store/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    /// Create instance when application start
    Get.put(NetworkManager());
    Get.put(VariationsController());
    Get.put(CheckoutController());
    Get.put(AddressController());
  }
}
