import 'package:get/get.dart';
import 'package:pr_store/data/repositories/product/product_repository.dart';
import 'package:pr_store/features/shop/models/brand_model.dart';
import 'package:pr_store/features/shop/models/product_model.dart';
import 'package:pr_store/utils/popups/loaders.dart';
import '../../../../data/repositories/Brand/brand_repository.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxBool isLoading = true.obs;

  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;

  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  /// Load Brands
  Future<void> getFeaturedBrands() async {
    try {
      /// Show loader while loading Brand
      isLoading.value = true;
      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);
      featuredBrands.assignAll(allBrands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      PrLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      /// Stop the loader
      isLoading.value = false;
    }
  }

  /// Get Brand For Category
  Future<List<BrandModel>> getBrandForCategory(String categoryId) async {
    try {
      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;
    } catch (e) {
      PrLoaders.errorSnackBar(title: 'Oh Snap !', message: e.toString());
      return [];
    }
  }

  /// Get Brand specific product from your data source
  Future<List<ProductModel>> getBrandProducts({required String brandId, int limit = -1}) async {
    try {
      final products =
          await ProductRepository.instance.getProductForBrand(brandId: brandId, limit: limit);
      return products;
    } catch (e) {
      PrLoaders.errorSnackBar(title: 'Oh Snap !', message: e.toString());
      return [];
    }
  }
}
