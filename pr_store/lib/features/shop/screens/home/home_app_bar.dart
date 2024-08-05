import 'package:flutter/material.dart';

import '../../../../common/widgets/app_bar/appbar.dart';
import '../../../../common/widgets/product_cart/cart_menu_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';

class PrHomeAppBar extends StatelessWidget {
  const PrHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PrAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(PrText.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .apply(color: PrColor.grey)),
          Text(PrText.homeAppbarSubTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: PrColor.white)),
        ],
      ),
      actions: [
        PrCartCounterIcon(
          onPressed: () {},
          iconColor: PrColor.white,
        ),
      ],
    );
  }
}
