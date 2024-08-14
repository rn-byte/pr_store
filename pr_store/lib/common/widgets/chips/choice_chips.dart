import 'package:flutter/material.dart';

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
    return ChoiceChip(
      label: Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? PrColor.white : null),
    );
  }
}
