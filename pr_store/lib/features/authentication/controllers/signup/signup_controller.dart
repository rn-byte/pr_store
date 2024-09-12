import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/popups/loaders.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variable
  ///Controller for firstName input
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // FormKey For Form Validation

  /// ---Sign-up
  Future<void> signup() async {
    try {
      /// Start Loading
      PrFullScreenLoader.openLoadingDialog(
          'We are Processing your information...', PrImage.applePay);

      /// check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PrFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if (!signupFormKey.currentState!.validate()) {
        PrFullScreenLoader.stopLoading();
        return;
      }

      /// Privacy Policy check

      /// Register user in the Firebase authentication and save user data in firebase

      /// Save authenticated user data in Firebase Fire-store

      /// show success message

      /// move to verify email screen
    } catch (e) {
      ///Show some Generic error to the user

      PrLoaders.errorSnackBar(title: 'Oh Snap !', message: e.toString());
    } finally {
      /// Remove Loader
    }
  }
}
