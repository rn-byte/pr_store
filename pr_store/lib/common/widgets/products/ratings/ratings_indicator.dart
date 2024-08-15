import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class PrRatingBarIndicator extends StatelessWidget {
  const PrRatingBarIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: 3.5,
        itemSize: 20,
        unratedColor: PrColor.grey,
        itemBuilder: (_, __) => const Icon(
              Iconsax.star1,
              color: PrColor.primary,
            ));
  }
}
