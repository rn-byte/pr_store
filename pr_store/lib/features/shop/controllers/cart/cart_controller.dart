import 'package:get/get.dart';
import 'package:pr_store/features/shop/controllers/product/variations_controller.dart';
import 'package:pr_store/features/shop/models/cart_item_model.dart';
import 'package:pr_store/features/shop/models/product_model.dart';
import 'package:pr_store/utils/constants/enum.dart';
import 'package:pr_store/utils/local_storage/storage_utility.dart';
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

    /// convert the product model to cartModel with the given quantity
    final selectedCartItem = convertToCartItem(product, productQuantityInCart.value);

    /// check if already added in cart
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      /// This quantity is already added or updated/Removed from the design (Cart)
      cartItems[index].quantity == selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    PrLoaders.customToast(message: 'Your product has been added to Cart.');
  }

  /// This Function converts product model to cart model
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      ///Reset Variation in case of single product type
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isvariation = variation.id.isNotEmpty;
    final price = isvariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModel(
      productId: product.id,
      quantity: quantity,
      title: product.title,
      price: price,
      variationId: variation.id,
      image: isvariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isvariation ? variation.attributeValues : null,
    );
  }

  /// Update Cart Values
  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    PrLocalStorage.instance().saveData('cartItems', cartItemStrings);
  }
}
