import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/common/widgets/shimmers/shimmer.dart';
import '../../../../../common/widgets/app_bar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../personalization/controllers/user/user_controller.dart';

class PrHomeAppBar extends StatelessWidget {
  const PrHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    return PrAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(PrText.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .apply(color: PrColor.grey)),
          Obx(() {
            if (userController.profileLoading.value) {
              return const PrShimmerEffect(width: 80, height: 15);
            } else {
              return Text(userController.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: PrColor.white));
            }
          })
        ],
      ),
      actions: [
        PrCartCounterIcon(
          iconColor: PrColor.white,
          onPressed: () {},
        ),
      ],
    );
  }
}
