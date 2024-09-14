import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pr_store/data/repositories/authentication/authentication_repository.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/helpers/network_manager.dart';
import 'package:pr_store/utils/popups/full_screen_loader.dart';
import 'package:pr_store/utils/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables
  final localStorage = GetStorage();
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }

  /// Login
  void emailAndPasswordSignin() async {
    try {
      /// Start Loading
      PrFullScreenLoader.openLoadingDialog(
          'Loggin you in....', PrImage.docerAnimation);

      /// Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PrFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if (!loginFormKey.currentState!.validate()) {
        PrFullScreenLoader.stopLoading();
        return;
      }

      /// Save data if Remember Me is Selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      /// Login User with Email and Password
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remoce Loader
      PrFullScreenLoader.stopLoading();

      /// Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      /// Remove Loader
      PrFullScreenLoader.stopLoading();

      /// Show some Generic error to the user
      PrLoaders.errorSnackBar(title: 'Oh Snap !!!', message: e.toString());
    }
  }
}
