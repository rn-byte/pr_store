import 'package:flutter/material.dart';
import 'package:pr_store/common/widgets/custom_shapes/curved_edges/curved_edge.dart';
import 'package:pr_store/utils/constants/colors.dart';

import '../../../../common/widgets/custom_shapes/containers/circular_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: PrCustomCurvedEdges(),
              child: Container(
                color: PrColor.primary,
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  height: 400,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -150,
                        right: -250,
                        child: PrCircularContainer(
                          backgroundColor: PrColor.textWhite.withOpacity(0.1),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        right: -300,
                        child: PrCircularContainer(
                          backgroundColor: PrColor.textWhite.withOpacity(0.1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
