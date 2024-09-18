import 'package:get/get.dart';
import 'package:pr_store/data/repositories/categories/categories_repository.dart';
import 'package:pr_store/features/shop/models/category_model.dart';
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
    }
  }
}
