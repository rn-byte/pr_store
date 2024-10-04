import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/utils/constants/sizes.dart';

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
    final controller = Get.put(AllPro)
    return Scaffold(
      appBar: PrAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(PrSizes.defaultSpace),
        child: FutureBuilder<Object>(
          future: futureMethod??,
          builder: (context, snapshot) {
            return const PrSortableProducts();
          }
        ),
      ),
    );
  }
}
