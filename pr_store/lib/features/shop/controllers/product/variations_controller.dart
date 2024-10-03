import 'package:get/get.dart';
import 'package:pr_store/features/shop/models/product_model.dart';
import 'package:pr_store/features/shop/models/product_variations_model.dart';

class VariationsController extends GetxController {
  static VariationsController get instance => Get.find();

  /// Variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  /// Select Attribute, and Variations
  void onAttributeSelected(ProductModel product, attributeName, attributeValue) {}

  /// check attribute availablity / stock in variation
  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {}

  /// Check product variations Stock Status
  void getProductVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  /// Reset selected attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
