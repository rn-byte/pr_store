import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pr_store/utils/devices/devices_utility.dart';
import 'package:pr_store/utils/helpers/helper.dart';

import '../../../utils/constants/sizes.dart';

class PrAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrAppBar(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.actions,
      this.leadingOnPressed,
      this.leadingIcon});
  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PrSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle:
            isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Iconsax.arrow_left))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(PrDeviceUtils.getAppBarHeight());
}
