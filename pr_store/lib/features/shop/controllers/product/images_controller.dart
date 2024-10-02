import 'package:get/get.dart';
import 'package:pr_store/features/shop/models/product_model.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  /// Variables
  RxString selectedProductImage = ''.obs;

  /// Get All the image form product and Variation
  List<String> getAllProductImages(ProductModel product) {}

  /// Show Image popup
  void showEnlargedImage(String image) {}
}
