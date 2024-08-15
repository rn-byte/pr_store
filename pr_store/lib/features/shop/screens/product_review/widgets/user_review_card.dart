import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pr_store/common/widgets/products/ratings/ratings_indicator.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    foregroundImage: AssetImage(PrImage.userProfileImage1)),
                const SizedBox(
                  width: PrSizes.spaceBtwItems,
                ),
                Text('Marry Jane',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            const Icon(Icons.more_vert)
          ],
        ),
        const SizedBox(
          height: PrSizes.spaceBtwItems,
        ),

        ///Review
        Row(
          children: [
            const PrRatingBarIndicator(rating: 3.4),
            const SizedBox(width: PrSizes.spaceBtwItems),
            Text('21 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(height: PrSizes.spaceBtwItems),
        const ReadMoreText(
          "Love this app! It’s super easy to use, with clear product images and fast checkout. Customer service is excellent, and I appreciate the real-time order tracking. Plus, the frequent discounts are a nice bonus. Highly recommend!",
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: ' Show less',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: PrColor.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: PrColor.primary),
        ),
        const SizedBox(
          height: PrSizes.spaceBtwItems,
        ),

        ///companyreview
        PrRoundedContainer(
          backgroundColor: isDark ? PrColor.darkerGrey : PrColor.grey,
          child: Padding(
            padding: const EdgeInsets.all(PrSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Pr Store',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('22 Nov, 2023',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: PrSizes.spaceBtwItems),
                const ReadMoreText(
                  "Thank you so much for your kind words! We're thrilled to hear that you're enjoying your experience with ShopEase. Our team works hard to make shopping as easy and enjoyable as possible, so it's great to see that reflected in your feedback. We're here if you ever need anything, and we look forward to serving you again soon! Happy shopping! 😊",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: ' Show less',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: PrColor.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: PrColor.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: PrSizes.spaceBtwSections,
        )
      ],
    );
  }
}
