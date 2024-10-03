import 'package:get/get.dart';
import 'package:pr_store/features/shop/controllers/product/images_controller.dart';
import 'package:pr_store/features/shop/models/product_model.dart';
import 'package:pr_store/features/shop/models/product_variations_model.dart';

class VariationsController extends GetxController {
  static VariationsController get instance => Get.find();

  /// Variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  /// Select Attribute, and Variations
  void onAttributeSelected(ProductModel product, attributeName, attributeValue) {
    /// When attribute is selected we will add that attributes to the selectedAttribute
    final selectedAttributes = Map<String, dynamic>.from(this.selectedAttributes);

    /// this local and global 'selectedAttributes' helps to compare value
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
        (variation) => _isSameAttributeValues(variation.attributeValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty());

    ///show the selected variation image as the main image
    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value = selectedVariation.image;
    }

    /// Assign the selected varitaion
    this.selectedVariation.value = selectedVariation;

    /// update selected product variation stock status
    getProductVariationStockStatus();
  }

  ///  check if selected attributes matches any variation attributes
  bool _isSameAttributeValues(
      Map<String, dynamic> variationAttributes, Map<String, dynamic> selectedAttributes) {
    /// If selectedAttributes contains 3 attributes and current variation contains 2 then return
    if (variationAttributes.length != selectedAttributes.length) return false;

    /// if any of the attributes is different then return. Eg : ['green','large'] X ['green','small']
    for (final key in variationAttributes.keys) {
      ///Attributes[key]=value which could be [green,small,cotton]etc.
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  /// check attribute availablity / stock in variation
  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    ///
  }

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
