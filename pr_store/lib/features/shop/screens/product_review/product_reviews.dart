import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/utils/constants/sizes.dart';

import 'widgets/progress_rating_and_indicator.dart';

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
                  'Rating and reviews are verified and are from people who use the same type of device that you use.'),
              const SizedBox(
                height: PrSizes.spaceBtwItems,
              ),

              ///Overall product ratings
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      '4.8',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  const Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        PrRatingProgressIndicator(text: '5', value: 1.0),
                        PrRatingProgressIndicator(text: '4', value: 0.8),
                        PrRatingProgressIndicator(text: '3', value: 0.6),
                        PrRatingProgressIndicator(text: '2', value: 0.4),
                        PrRatingProgressIndicator(text: '1', value: 0.2),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
