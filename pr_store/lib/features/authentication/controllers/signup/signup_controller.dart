import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/data/repositories/authentication/authentication_repository.dart';
import 'package:pr_store/data/repositories/users/user_repository.dart';
import 'package:pr_store/features/authentication/models/user_model.dart';
import 'package:pr_store/features/authentication/screens/signup/verify_email.dart';
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
  void signup() async {
    try {
      /// Start Loading
      PrFullScreenLoader.openLoadingDialog(
          'We are Processing your information...', PrImage.docerAnimation);

      /// check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //Remove Loader
        PrFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if (!signupFormKey.currentState!.validate()) {
        //Remove Loader
        PrFullScreenLoader.stopLoading();
        return;
      }

      /// Privacy Policy check

      if (!privacyPolicy.value) {
        PrFullScreenLoader.stopLoading();
        PrLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In Order to create an account, you must have to read and accept the Privacy Policy and Terms of Use.');
        return;
      }

      /// Register user in the Firebase authentication and save user data in firebase

      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      /// Save authenticated user data in Firebase Fire-store
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          userName: userName.text.trim(),
          lastName: lastName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //Remove Loader
      PrFullScreenLoader.stopLoading();

      /// show success message
      PrLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created ! Verify Email to continue.');

      /// move to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      //Remove Loader
      PrFullScreenLoader.stopLoading();

      ///Show some Generic error to the user
      PrLoaders.errorSnackBar(title: 'Oh Snap !', message: e.toString());
    }
  }
}
