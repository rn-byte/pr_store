// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/helper.dart';

/// A widget for Displaying an animated loading indicator with optional
/// text and action button
class PrAnimationLoaderWidget extends StatelessWidget {
  /// Default Constructor for the PrAnimationLoaderWidget
  ///
  /// ----------PARAMETERS-------------
  ///   - Text: The Text to be displayed below the animation
  ///   - Animation: The Path to the lottie animation file
  ///   - showAction: Weather to show an action below the text
  ///   - ActionText: The text to be displayed on the action button
  ///   - onActionPressed: callBack function to be executed when action button is pressed
  ///

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  const PrAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            animation,
            width: MediaQuery.of(context).size.width * 0.8,
          ), // Display Lottie Animation
          const SizedBox(height: PrSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: PrSizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                      onPressed: onActionPressed,
                      child: Text(
                        actionText!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: PrColor.light),
                      )),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
