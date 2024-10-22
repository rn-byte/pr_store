import 'package:flutter/material.dart';

import 'progress_rating_and_indicator.dart';

class PrOverallProductRatings extends StatelessWidget {
  const PrOverallProductRatings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
