import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/custom_shapes/curved_edges/curved_edge.dart';

class PrCurvedEdgeWidget extends StatelessWidget {
  const PrCurvedEdgeWidget({
    super.key,
    this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: PrCustomCurvedEdges(),
      child: child,
    );
  }
}
