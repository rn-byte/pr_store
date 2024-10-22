import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pr_store/data/repositories/product/product_repository.dart';
import 'package:pr_store/utils/popups/loaders.dart';
import '../../models/product_model.dart';

class AllProductController extends GetxController {
  static AllProductController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];

      final product = await repository.fetchProductsByQuery(query);
      return product;
    } catch (e) {
      PrLoaders.errorSnackBar(title: 'Oh Snap !', message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOptions) {
    selectedSortOption.value = sortOptions;

    switch (sortOptions) {
      case 'Name':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Higher Price':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Lower Price':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Sale':
        products.sort((a, b) {
          if (b.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice > 0) {
            return -1;
          } else {
            return 1;
          }
        });
        break;
      // case 'Newest':
      //   products.sort((a, b) => a.date!.compareTo(b.date!));
      //   break;
      default:

        /// Default sorting options Name
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
    }
  }

  void assignProducts(List<ProductModel> products) {
    /// Assign product to the 'products' list
    this.products.assignAll(products);
    sortProducts('Name');
  }
}
