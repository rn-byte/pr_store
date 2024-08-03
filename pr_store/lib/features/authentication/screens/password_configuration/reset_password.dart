import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pr_store/utils/constants/sizes.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: const EdgeInsets.all(PrSizes.defaultSpace),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
