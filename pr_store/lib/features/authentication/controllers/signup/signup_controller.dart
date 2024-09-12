import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/popups/loaders.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variable
  ///Controller for  input fields
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
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
          'We are Processing your information...', PrImage.docerAnimation);

      /// check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      /// Form Validation
      if (!signupFormKey.currentState!.validate()) {
        return;
      }

      /// Privacy Policy check

      if (!privacyPolicy.value) {
        PrLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In Order to create an account, you must have to read and accept the Privacy Policy and Terms of Use.');
      }

      /// Register user in the Firebase authentication and save user data in firebase

      /// Save authenticated user data in Firebase Fire-store

      /// show success message

      /// move to verify email screen
    } catch (e) {
      ///Show some Generic error to the user

      PrLoaders.errorSnackBar(title: 'Oh Snap !', message: e.toString());
    } finally {
      /// Remove Loader
      PrFullScreenLoader.stopLoading();
    }
  }
}
