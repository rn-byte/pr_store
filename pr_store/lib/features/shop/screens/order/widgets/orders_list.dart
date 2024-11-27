import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pr_store/common/widgets/loaders/animation_loader.dart';
import 'package:pr_store/features/shop/controllers/order/order_controller.dart';
import 'package:pr_store/navigation_menu.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/helpers/cloud_helper_functions.dart';
import 'package:pr_store/utils/helpers/helper.dart';

class PrOrderListItems extends StatelessWidget {
  const PrOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final isDark = PrHelper.isDarkMode(context);
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (_, snapshot) {
          /// Nothing found widget
          final emptyWidget = PrAnimationLoaderWidget(
            text: 'Woops! No order yet !',
            animation: PrImage.orderCompletedAnimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          /// Helper function : Handle Loader, no record or Error message
          final response = PrCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;

          /// Congratulation !!!! Record Found
          final orders = snapshot.data!;
          return ListView.separated(
            shrinkWrap: true,
            itemCount: orders.length,
            separatorBuilder: (_, index) =>
                const SizedBox(height: PrSizes.spaceBtwItems),
            itemBuilder: (_, index) {
              final order = orders[index];
              return PrRoundedContainer(
                padding: const EdgeInsets.all(PrSizes.md),
                showBorder: true,
                backgroundColor: isDark ? PrColor.dark : PrColor.light,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ///Row 1
                    Row(
                      children: [
                        ///1 Icon
                        const Icon(Iconsax.ship),
                        const SizedBox(width: PrSizes.spaceBtwItems / 2),

                        ///2 Status and date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order.orderStatusText,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(
                                        color: PrColor.primary,
                                        fontWeightDelta: 1),
                              ),
                              Text(order.formattedOrderDate,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall)
                            ],
                          ),
                        ),

                        /// 3 Icon
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Iconsax.arrow_right_34,
                                size: PrSizes.iconSm))
                      ],
                    ),
                    const SizedBox(height: PrSizes.spaceBtwItems),

                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              ///1 Icon
                              const Icon(Iconsax.tag),
                              const SizedBox(width: PrSizes.spaceBtwItems / 2),

                              ///2 Status and date
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Order',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium),
                                    Text(order.id,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              ///1 Icon
                              const Icon(Iconsax.calendar),
                              const SizedBox(width: PrSizes.spaceBtwItems / 2),

                              ///2 Status and date
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Shipping Date',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium),
                                    Text(order.formattedDeliveryDate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
