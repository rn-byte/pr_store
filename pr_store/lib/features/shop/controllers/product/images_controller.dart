import 'package:get/get.dart';
import 'package:pr_store/features/shop/models/product_model.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  /// Variables
  RxString selectedProductImage = ''.obs;

  /// Get All the image form product and Variation
  List<String> getAllProductImages(ProductModel product) {
    /// using set string to add unique image only
    Set<String> images = {};

    ///Load Thumbnail image
    images.add(product.thumbnail);

    /// Assiging Thumbnail image as selected image
    selectedProductImage.value = product.thumbnail;

    /// Get all the images from the product model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

    /// Get all the image from the product variations if not null
    if (product.productVariations != null || product.productVariations!.isNotEmpty) {
      images.addAll(product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  /// Show Image popup
  void showEnlargedImage(String image) {}
}
