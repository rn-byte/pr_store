import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/shop/controllers/favourite/favourite_controller.dart';
import '../../icons/pr_circular_icon.dart';

class PrFavouriteIcon extends StatelessWidget {
  const PrFavouriteIcon({super.key, this.backgroundColor});

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return PrCircularIcon(
      icon: Iconsax.heart5,
      color: Colors.red,
      backgroundColor: backgroundColor,
    );
  }
}
