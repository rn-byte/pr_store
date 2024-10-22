import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/login/login.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  final storage = GetStorage();

  /// update current index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  //Jump to specific dot selected page
  void dotNavigationNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  //update current index and jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      // if (kDebugMode) {
      //   print('<_____GET_STORAGE____NEXT-BUTTON____________');
      //   print(storage.read('IsFirstTime'));
      // }

      storage.write('IsFirstTime', false);
      Get.to(() => const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  //update current index and jump to last index
  void skipPage() {
    // if (kDebugMode) {
    //   print('<_____GET_STORAGE____skip-BUTTON____________');
    //   print(storage.read('IsFirstTime'));
    // }
    storage.write('IsFirstTime', false);
    Get.to(() => const LoginScreen());
  }
}
