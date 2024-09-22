import 'package:get/get.dart';
import 'package:pr_store/data/repositories/banner/banner_repository.dart';
import 'package:pr_store/features/shop/models/banner_models.dart';
import 'package:pr_store/utils/popups/loaders.dart';

class BannerController extends GetxController {
  /// Variables
  final carouselCurrehtIndex = 0.obs;

  final isLoading = false.obs;

  RxList<BannerModels> banners = <BannerModels>[].obs;

  /// update page Navigational dots
  void updatePageIndicator(index) {
    carouselCurrehtIndex.value = index;
  }

  /// Fetch banner
  Future<void> fetchBanners() async {
    try {
      /// Show loader while loading categories
      isLoading.value = true;

      /// Fetch banner
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      /// Assigning banner
      this.banners.assignAll(banners);
    } catch (e) {
      PrLoaders.errorSnackBar(title: "Oh Snap !", message: e.toString());
    } finally {
      /// Remove loader
      isLoading.value = false;
    }
  }
}
