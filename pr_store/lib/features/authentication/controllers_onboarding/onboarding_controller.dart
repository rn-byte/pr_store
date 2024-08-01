import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  /// Variables

  /// update current index when page scroll
  void updatePageIndicator(index) {}

  //Jump to specific dot selected page
  void dotNavigationNavigationClick(index) {}

  //upate current index and jump to next page
  void nextPage() {}

  //update current index and jump to last index
  void skipPge() {}
}
