import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/images/pr_circular_image.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class PrVerticalImageText extends StatelessWidget {
  const PrVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = PrColor.white,
    this.backgroundColor,
    this.isNetworkImage = true,
    this.onTap,
  });
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    //final isDark = PrHelper.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: PrSizes.spaceBtwItems),
        child: Column(
          children: [
            ///Circular icon
            PrCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: PrSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              //overlayColor: isDark ? PrColor.dark : PrColor.light,
            ),
            // Container(
            //   height: 56,
            //   width: 56,
            //   padding: const EdgeInsets.all(PrSizes.sm),
            //   decoration: BoxDecoration(
            //     color:
            //         backgroundColor ?? (isDark ? PrColor.black : PrColor.white),
            //     borderRadius: BorderRadius.circular(100),
            //   ),
            //   child: Center(
            //     child: Image(
            //       image: AssetImage(image),
            //       fit: BoxFit.cover,
            //       color: (isDark ? PrColor.light : PrColor.dark),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: PrSizes.spaceBtwItems / 2,
            ),

            ///Title Text
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
