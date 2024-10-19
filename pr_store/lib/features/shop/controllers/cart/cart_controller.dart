import 'package:get/get.dart';
import 'package:pr_store/features/shop/controllers/product/variations_controller.dart';
import 'package:pr_store/features/shop/models/cart_item_model.dart';
import 'package:pr_store/features/shop/models/product_model.dart';
import 'package:pr_store/utils/constants/enum.dart';
import 'package:pr_store/utils/popups/loaders.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  /// Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationsController.instance;

  /// Add items in the cart
  void addToCart(ProductModel product) {
    /// Quantity check
    if (productQuantityInCart.value < 1) {
      PrLoaders.customToast(message: 'Select Quantity');
      return;
    }

    /// Variations Selected?
    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      PrLoaders.customToast(message: 'Select Variation');
      return;
    }

    /// Out of Stock Status
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        PrLoaders.warningSnackBar(
            message: 'Selected Variation is out of Stock.', title: 'Oh Snap !');
        return;
      }
    } else {
      if (product.stock < 1) {
        PrLoaders.warningSnackBar(title: 'Oh Snap !', message: 'Selected Product is out of Stock.');
      }
    }
  }
}
