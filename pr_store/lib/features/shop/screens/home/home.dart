import 'package:flutter/material.dart';
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
            Container(
              color: PrColor.primary,
              padding: const EdgeInsets.all(0),
              child: Stack(
                children: [
                  PrCircularContainer(
                    backgroundColor: PrColor.textWhite.withOpacity(0.1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
