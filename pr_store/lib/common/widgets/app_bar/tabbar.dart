import 'package:flutter/material.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/devices/devices_utility.dart';
import 'package:pr_store/utils/helpers/helper.dart';

class PrTabBar extends StatelessWidget implements PreferredSizeWidget {
  ///if you want to add background color to  TAB, you have to wrap them in material Widget.
  ///To do that we need [PreferredSize] widget and that's why we created custom class.
  const PrTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final isDark = PrHelper.isDarkMode(context);
    return Material(
      color: isDark ? PrColor.black : PrColor.white,
      child: TabBar(
        padding: EdgeInsets.zero,
        tabs: tabs,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        indicatorColor: PrColor.primary,
        unselectedLabelColor: PrColor.darkGrey,
        labelColor: isDark ? PrColor.white : PrColor.primary,
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(PrDeviceUtils.getAppBarHeight() * 0.858);
}
