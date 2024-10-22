import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/features/shop/models/product_model.dart';
import 'package:pr_store/utils/constants/sizes.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  /// Variables
  RxString selectedProductImage = ''.obs;

  /// Get All the image form product and Variation
  List<String> getAllProductImages(ProductModel product) {
    /// using set string to add unique image only
    Set<String> images = {};

    ///Load Thumbnail image
    images.add(product.thumbnail);

    /// Assiging Thumbnail image as selected image
    selectedProductImage.value = product.thumbnail;

    /// Get all the images from the product model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

    /// Get all the image from the product variations if not null
    if (product.productVariations != null || product.productVariations!.isNotEmpty) {
      images.addAll(product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  /// Show Image popup
  void showEnlargedImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: PrSizes.defaultSpace * 2, horizontal: PrSizes.defaultSpace),
                    child: CachedNetworkImage(imageUrl: image),
                  ),
                  const SizedBox(height: PrSizes.spaceBtwSections),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 150,
                      child:
                          OutlinedButton(onPressed: () => Get.back(), child: const Text('Close')),
                    ),
                  ),
                ],
              ),
            ));
  }
}
