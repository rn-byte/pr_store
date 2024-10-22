import 'package:get/get.dart';
import 'package:pr_store/data/repositories/categories/categories_repository.dart';
import 'package:pr_store/data/repositories/product/product_repository.dart';
import 'package:pr_store/features/shop/models/category_model.dart';
import 'package:pr_store/features/shop/models/product_model.dart';
import 'package:pr_store/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;

  final _categoryRepository = Get.put(CategoriesRepository());

  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// Load category data
  Future<void> fetchCategories() async {
    try {
      /// showing loader while loading categories
      isLoading.value = true;

      /// Fetch categories from data source(Firebase,api etc)
      final categories = await _categoryRepository.getAllCategories();

      /// update the categories list
      allCategories.assignAll(categories);

      /// filter featured categories  *Assigning parent category
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      PrLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      /// remove loading
      isLoading.value = false;
    }
  }

  /// Load selected category data
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subCategories = await _categoryRepository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      PrLoaders.errorSnackBar(title: 'Oh Snap !', message: e.toString());
      return [];
    }
  }

  /// Get category or sub-category products
  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryId, int limit = 4}) async {
    /// fetch limited 4 products against each sub category
    try {
      final products = await ProductRepository.instance
          .getProductsForCategory(categoryId: categoryId, limit: limit);
      return products;
    } catch (e) {
      PrLoaders.errorSnackBar(title: 'Oh Snap !', message: e.toString());
      return [];
    }
  }
}
