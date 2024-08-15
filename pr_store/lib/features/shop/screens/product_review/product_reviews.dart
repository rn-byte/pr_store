import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import '../../../../common/widgets/products/ratings/ratings_indicator.dart';
import 'widgets/rating_progress_indicator.dart';

class PrProductReviews extends StatelessWidget {
  const PrProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      ///appbar
      appBar: PrAppBar(
        title: Text('Reviews and Ratings'),
        showBackArrow: true,
      ),

      ///body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(PrSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rating and reviews are verified and are from people who use the same type of device that you use.',
              ),
              SizedBox(
                height: PrSizes.spaceBtwItems,
              ),

              ///Overall product ratings
              PrOverallProductRatings(),
              PrRatingBarIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
