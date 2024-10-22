import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/utils/constants/colors.dart';
import 'package:pr_store/utils/helpers/helper.dart';

import '../../common/widgets/loaders/animation_loader.dart';

/// A utility class for managing a full-screen loading dialog
class PrFullScreenLoader {
  /// Open a full-Screen loading dialog with the given text and animation
  /// this method doesn't return anything
  ///
  /// _______PARAMETERS________
  /// Text- The text to be displayed in the loading dialog
  /// Animation - The lottie animation to be shown
  ///

  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!, // Use Get.overlayContext for overlay dialog
      barrierDismissible:
          false, // The Dialog can't be dismissed by tapping outside it
      builder: (_) => PopScope(
        canPop: false, // Disable popping with the back button
        child: Container(
          color: PrHelper.isDarkMode(Get.context!)
              ? const Color.fromARGB(255, 0, 0, 0)
              : PrColor.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //const SizedBox(height: 200), // Adjust the Spacing as needed
              PrAnimationLoaderWidget(
                text: text,
                animation: animation,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Stop the currently open loading dialog
  /// This Method Does't return anything
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); //Close the dialog using Navigator
  }
}
