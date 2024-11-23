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
  //final variationController = VariationsController.instance;
  final variationController = Get.put(VariationsController());

  CartController() {
    loadCartItems();
  }

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
        PrLoaders.warningSnackBar(
            title: 'Oh Snap !', message: 'Selected Product is out of Stock.');
      }
    }

    /// convert the product model to cartModel with the given quantity
    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

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

  /// adding one item to cart
  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItems) =>
        cartItems.productId == item.productId &&
        cartItems.variationId == item.variationId);
    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }
    updateCart();
  }

  /// removing one item from cart
  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItems) =>
        cartItems.productId == item.productId &&
        cartItems.variationId == item.variationId);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        /// Showing dialogue before completely removing
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  /// Removing Cart Dialog
  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this  product?',
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        PrLoaders.customToast(message: 'Product removes from the cart.');
        Get.back();
      },
      onCancel: () => Get.back(),
    );
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

  void loadCartItems() {
    final cartItemsStrings =
        PrLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemsStrings != null) {
      cartItems.assignAll(cartItemsStrings
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
      (item) => item.productId == productId && item.variationId == variationId,
      orElse: () => CartItemModel.empty(),
    );
    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}
