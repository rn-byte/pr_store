import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/text_strings.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrPrimaryHeaderConatiner(
              child: Column(
                children: [
                  PrAppBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(PrText.homeAppbarTitle,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(color: PrColor.grey)),
                        Text(PrText.homeAppbarSubTitle,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .apply(color: PrColor.white)),
                      ],
                    ),
                    actions: [
                      Stack(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Iconsax.shopping_bag)),
                          Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text(
                                '2',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .apply(
                                        color: PrColor.white.withOpacity(0.8)),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
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
