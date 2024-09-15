import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pr_store/data/repositories/authentication/authentication_repository.dart';
import 'package:pr_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/helpers/network_manager.dart';
import 'package:pr_store/utils/popups/full_screen_loader.dart';
import 'package:pr_store/utils/popups/loaders.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  /// Variable
  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordFromKey = GlobalKey<FormState>();

  ///send  Password Rest Email
  sendPasswordRestEmail() async {
    try {
      /// Start Loading
      PrFullScreenLoader.openLoadingDialog(
          'Processing your Request.....', PrImage.docerAnimation);

      /// Check Internt Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PrFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if (!forgotPasswordFromKey.currentState!.validate()) {
        PrFullScreenLoader.stopLoading();
        return;
      }

      /// Send Email to reset Password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      /// Remove loader
      PrFullScreenLoader.stopLoading();

      /// Show success Screen
      PrLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link sent to RESET Your Password');

      /// Redirect Screen
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      /// Remove Loader
      PrFullScreenLoader.stopLoading();
      PrLoaders.errorSnackBar(title: 'Oh Snap ', message: e.toString());
    }
  }

  ///Re-Send Password Rest Email
  resendPasswordRestEmail(String email) async {
    try {
      /// Start Loading
      PrFullScreenLoader.openLoadingDialog(
          'Processing your Request.....', PrImage.docerAnimation);

      /// Check Internt Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PrFullScreenLoader.stopLoading();
        return;
      }

      /// Send Email to reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      /// Remove loader
      PrFullScreenLoader.stopLoading();

      /// Show success Screen
      PrLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link sent to RESET Your Password');
    } catch (e) {
      /// Remove Loader
      PrFullScreenLoader.stopLoading();
      PrLoaders.errorSnackBar(title: 'Oh Snap ', message: e.toString());
    }
  }
}
