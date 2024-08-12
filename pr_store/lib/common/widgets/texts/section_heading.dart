import 'package:flutter/material.dart';

class PrSectionHeading extends StatelessWidget {
  const PrSectionHeading({
    super.key,
    required this.title,
    this.buttonTitle = 'View all',
    this.textColor,
    this.showActionButton = true,
    this.onPressed,
  });
  final String title, buttonTitle;
  final Color? textColor;
  final bool showActionButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle)),
      ],
    );
  }
}
