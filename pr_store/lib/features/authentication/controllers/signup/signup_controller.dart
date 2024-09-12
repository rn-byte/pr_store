import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/utils/constants/image_strings.dart';

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
  Future<Void> signup() async {
    try {
      /// Start Loading
      PrFullScreenLoader.openLoadingDialog(
          'We are Processing your information...', PrImage.docerAnimation);

      /// check Internet Connectivity

      /// Form Validation

      /// Privacy Policy check

      /// Register user in the Firebase authentication and save user data in firebase

      /// Save authenticated user data in Firebase Fire-store

      /// show success message

      /// move to verify email screen
    } catch (e) {
      ///Show some Generic error to the user
    } finally {
      /// Remove Loader
    }
  }
}
