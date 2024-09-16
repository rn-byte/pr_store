import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/features/personalization/controllers/user/user_controller.dart';

import '../../../../utils/constants/colors.dart';
import '../../images/pr_circular_image.dart';

class PrProfileUserTile extends StatelessWidget {
  const PrProfileUserTile({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Obx(
      () => ListTile(
        leading: const PrCircularImage(
          backgroundColor: Colors.transparent,
          image: 'assets/images/user/user.png',
          height: 50,
          width: 50,
          padding: 0,
          fit: BoxFit.contain,
        ),
        title: Text(
          controller.user.value.fullName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: PrColor.white),
        ),
        subtitle: Text(
          controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: PrColor.white),
        ),
        trailing: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Iconsax.edit,
              color: PrColor.white,
            )),
      ),
    );
  }
}
