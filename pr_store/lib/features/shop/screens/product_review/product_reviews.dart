import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/features/shop/screens/product_review/widgets/user_review_card.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import '../../../../common/widgets/products/ratings/ratings_indicator.dart';
import 'widgets/rating_progress_indicator.dart';

class PrProductReviews extends StatelessWidget {
  const PrProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///appbar
      appBar: const PrAppBar(
        title: Text('Reviews and Ratings'),
        showBackArrow: true,
      ),

      ///body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PrSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Rating and reviews are verified and are from people who use the same type of device that you use.',
              ),
              const SizedBox(
                height: PrSizes.spaceBtwItems,
              ),

              ///Overall product ratings
              const PrOverallProductRatings(),
              const PrRatingBarIndicator(rating: 3.5),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(
                height: PrSizes.spaceBtwSections,
              ),

              /// User Review List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
