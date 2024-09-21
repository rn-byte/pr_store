import 'package:get/get.dart';
import 'package:pr_store/data/repositories/categories/categories_repository.dart';
import 'package:pr_store/features/shop/models/category_model.dart';
import 'package:pr_store/utils/popups/loaders.dart';

class BannerController extends GetxController {
  /// Variables
  final carouselCurrehtIndex = 0.obs;

  final isLoading = false.obs;

  final _categoriesRepository = Get.put(CategoriesRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  /// update page Navigational dots
  void updatePageIndicator(index) {
    carouselCurrehtIndex.value = index;
  }

  /// Fetch banner
  Future<void> fetchBanners() async {
    try {
      /// Show loader while loading categories
      isLoading.value = true;

      /// Fetch categories from data sources(Firebase,API etc.)
      final categories = await _categoriesRepository.getAllCategories();

      /// update the categories list
      allCategories.assignAll(categories);

      /// Filter featured categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      PrLoaders.errorSnackBar(title: "Oh Snap !", message: e.toString());
    } finally {
      /// Remove loader
      isLoading.value = false;
    }
  }
}
