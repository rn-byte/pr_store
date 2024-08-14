import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:pr_store/utils/helpers/helper.dart';

import '../../../utils/constants/colors.dart';

class PrChoiceChip extends StatelessWidget {
  const PrChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    final isColor = PrHelper.getColor(text) != null;
    return ChoiceChip(
      label: isColor ? const SizedBox() : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? PrColor.white : null),
      avatar: isColor
          ? PrCircularContainer(
              width: 50, height: 50, backgroundColor: PrHelper.getColor(text)!)
          : null,
      shape: isColor ? const CircleBorder() : null,
      labelPadding: isColor ? const EdgeInsets.all(0) : null,
      padding: isColor ? const EdgeInsets.all(0) : null,
      selectedColor: isColor ? PrHelper.getColor(text)! : null,
      backgroundColor: isColor ? PrHelper.getColor(text)! : null,
    );
  }
}
