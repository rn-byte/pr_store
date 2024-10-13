import 'dart:convert';

import 'package:get/get.dart';
import 'package:pr_store/data/repositories/product/product_repository.dart';
import 'package:pr_store/features/shop/models/product_model.dart';
import 'package:pr_store/utils/local_storage/storage_utility.dart';
import 'package:pr_store/utils/popups/loaders.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();

  /// Variable
  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourite();
  }

  /// Method to initialize favourites by reading from storage
  void initFavourite() {
    final json = PrLocalStorage.instance().readData('favourites');
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  void toggleFavouriteProduct(String productId) {
    if (!favourites.containsKey(productId)) {
      favourites[productId] = true;
      saveFavouritesToStorage();
      PrLoaders.customToast(message: 'Product has been added to the Wishlist.');
    } else {
      PrLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      PrLoaders.customToast(message: 'Product has been removed from the Wishlist.');
    }
  }

  void saveFavouritesToStorage() {
    final encodedFavourites = jsonEncode(favourites);
    PrLocalStorage.instance().saveData('favourites', encodedFavourites);
  }

  Future<List<ProductModel>> favouriteProducts() async {
    return await ProductRepository.instance.getFavouriteProducts(favourites.keys.toList());
  }
}
