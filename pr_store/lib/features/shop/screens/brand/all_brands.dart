import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/common/widgets/app_bar/appbar.dart';
import 'package:pr_store/common/widgets/brands/brand_card_widget.dart';
import 'package:pr_store/common/widgets/layouts/grid_layout/grid_layout.dart';
import 'package:pr_store/common/widgets/texts/section_heading.dart';
import 'package:pr_store/features/shop/controllers/brand/brand_controller.dart';
import 'package:pr_store/features/shop/screens/brand/brand_products.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import '../../../../common/widgets/shimmers/brand_shimmer.dart';
import '../../../../utils/constants/colors.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({
    super.key,
  });
  //final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const PrAppBar(title: Text('All Brands'), showBackArrow: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(PrSizes.defaultSpace),
        child: Column(
          children: [
            /// Heading
            const PrSectionHeading(
              title: 'Brands',
              showActionButton: false,
            ),
            const SizedBox(height: PrSizes.spaceBtwItems),

            /// Brands
            Obx(() {
              if (brandController.isLoading.value) return const PrBrandShimmer();

              if (brandController.allBrands.isEmpty) {
                return Center(
                  child: Text(
                    'No Data Found !',
                    style: Theme.of(context).textTheme.bodyMedium!.apply(color: PrColor.white),
                  ),
                );
              }
              return PrGridLayout(
                  itemCount: brandController.allBrands.length,
                  mainAxisExtent: 80,
                  itemBuilder: (_, index) {
                    //In backend part we will pass each brans and onPressed event
                    final brand = brandController.allBrands[index];

                    return PrBrandCard(
                      showBorder: true,
                      brand: brand,
                      onTap: () => Get.to(() => BrandProducts(
                            brand: brand,
                          )),
                    );
                  });
            })
          ],
        ),
      ),
    );
  }
}
