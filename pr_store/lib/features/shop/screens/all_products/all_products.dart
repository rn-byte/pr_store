import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:pr_store/features/shop/controllers/product/all_product_controller.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/cloud_helper_functions.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../models/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({
    super.key,
    required this.title,
    this.query,
    this.futureMethod,
  });
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    return Scaffold(
      appBar: PrAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(PrSizes.defaultSpace),
        child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              /// checking the state of futureBuilder Snapshot
              const loader = PrVerticalProductShimmer();
              final widget =
                  PrCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

              /// Return appropriate widget based on snapshot data
              if (widget != null) return widget;

              /// Product found
              final products = snapshot.data!;

              return PrSortableProducts(
                products: products,
              );
            }),
      ),
    );
  }
}
