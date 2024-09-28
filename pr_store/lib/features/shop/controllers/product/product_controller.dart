import 'package:get/get.dart';
import 'package:pr_store/features/shop/models/product_model.dart';
import 'package:pr_store/utils/popups/loaders.dart';

import '../../../../data/repositories/product/product_repository.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;

  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProduct = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProduct();
    super.onInit();
  }

  void fetchFeaturedProduct() async {
    try {
      /// Show loader while loading product
      isLoading.value = true;

      /// Fetch products
      final products = await productRepository.getFeaturedProducts();

      /// assign products
      featuredProduct.assignAll(products);
    } catch (e) {
      PrLoaders.errorSnackBar(title: 'Oh Snap !', message: e.toString());
    } finally {
      /// Stop the loader
      isLoading.value = false;
    }
  }
}
