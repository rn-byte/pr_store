import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../icons/pr_circular_icon.dart';

class PrFavouriteIcon extends StatelessWidget {
  const PrFavouriteIcon({super.key, this.backgroundColor});

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return PrCircularIcon(
      icon: Iconsax.heart5,
      color: Colors.red,
      backgroundColor: backgroundColor,
    );
  }
}
