import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/utils/constants/colors.dart';
import '../../../../features/shop/controllers/favourite/favourite_controller.dart';
import '../../icons/pr_circular_icon.dart';

class PrFavouriteIcon extends StatelessWidget {
  const PrFavouriteIcon({super.key, this.backgroundColor, required this.productId});

  final Color? backgroundColor;
  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Obx(
      () => PrCircularIcon(
        icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(productId) ? PrColor.error : null,
        backgroundColor: backgroundColor,
        onPressed: () => controller.toggleFavouriteProduct(productId),
      ),
    );
  }
}
