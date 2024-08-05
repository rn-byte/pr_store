import 'package:flutter/material.dart';
import 'package:pr_store/features/shop/screens/home/home_app_bar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrPrimaryHeaderConatiner(
              child: Column(
                children: [
                  PrHomeAppBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
