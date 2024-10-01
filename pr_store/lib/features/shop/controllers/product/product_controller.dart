import 'package:get/get.dart';
import 'package:pr_store/features/shop/models/product_model.dart';
import 'package:pr_store/utils/constants/enum.dart';
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

  /// Get the product price or the price range for variations
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    /// If no variation exists, return the simple price or sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    } else {
      /// Calculating the smallest and largest price among variations
      for (var variation in product.productVariations!) {
        /// Determine the price to consider(sale price if available otherwise regular price)
        double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        /// update smallest and largest price
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      /// if smallest and largest price are same , return single price
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        /// otherwise return Price range
        return '$smallestPrice - $largestPrice';
      }
    }
  }

  /// Calculate discount percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) null;
    if (originalPrice <= 0) null;

    double percentage = ((originalPrice - salePrice!) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  /// Check Product Stock status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
