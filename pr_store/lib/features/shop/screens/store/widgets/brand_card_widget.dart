import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/images/Pr_circular_image.dart';
import '../../../../../common/widgets/texts/brand_title_text_with_verified_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enum.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper.dart';

class PrBrandCard extends StatelessWidget {
  const PrBrandCard({
    super.key,
    required this.showBorder,
  });
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final bool isDark = PrHelper.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: PrRoundedContainer(
        padding: const EdgeInsets.all(PrSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            //icon
            Flexible(
              child: PrCircularImage(
                isNetworkImage: false,
                image: PrImage.clothIcon,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? PrColor.white : PrColor.black,
              ),
            ),
            const SizedBox(width: PrSizes.spaceBtwItems / 2),

            ///--------- Text------------------///
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PrBrandTitleWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '256 products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
