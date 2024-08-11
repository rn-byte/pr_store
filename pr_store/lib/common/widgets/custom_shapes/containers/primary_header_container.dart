import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class PrPrimaryHeaderConatiner extends StatelessWidget {
  const PrPrimaryHeaderConatiner({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PrCurvedEdgeWidget(
      child: Container(
        color: PrColor.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          child: Stack(
            children: [
              ///Background custom shape
              Positioned(
                  top: -150,
                  right: -250,
                  child: PrCircularContainer(
                      backgroundColor: PrColor.textWhite.withOpacity(0.1))),
              Positioned(
                  top: 100,
                  right: -300,
                  child: PrCircularContainer(
                      backgroundColor: PrColor.textWhite.withOpacity(0.1))),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
