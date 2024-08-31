import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          PrAppBar(title: const Text('Popular Products'), showBackArrow: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(PrSizes.defaultSpace),
        child: Column(
          children: [
            /// DropDown
            DropdownButtonFormField(
              decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
              onChanged: (value) {},
              items: [
                'Name',
                'Higher Price',
                'Lower Price',
                'Sale',
                'Newest',
                'Popularity'
              ]
                  .map((option) =>
                      DropdownMenuItem(value: option, child: Text(option)))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
