import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_store/data/repositories/users/user_repository.dart';
import 'package:pr_store/features/personalization/controllers/user/user_controller.dart';
import 'package:pr_store/features/personalization/screens/profile/profile.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/popups/full_screen_loader.dart';
import 'package:pr_store/utils/popups/loaders.dart';

import '../../../../utils/helpers/network_manager.dart';

/// Controller to manage user related functionality
class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  /// Variables
  final firstName = TextEditingController();
  final lastName = TextEditingController();

  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  GlobalKey<FormState> updateUserNameFromKey = GlobalKey<FormState>();

  /// init user data when homeScreen appear
  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  /// Fetch User Record
  Future<void> initializeName() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      /// start loading
      PrFullScreenLoader.openLoadingDialog(
          'We are updating your information...', PrImage.docerAnimation);

      /// Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PrFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if (!updateUserNameFromKey.currentState!.validate()) {
        PrFullScreenLoader.stopLoading();
        return;
      }

      /// Update user's first and last name in Firebase Firestore
      Map<String, dynamic> name = {
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim(),
      };
      await userRepository.updateSingleField(name);

      /// Update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      /// Remove Loader
      PrFullScreenLoader.stopLoading();

      /// Show succedd message
      PrLoaders.successSnackBar(
          title: 'Congratulation !', message: 'Your Name has been Updated.');

      /// Move to Previous Screen
      Get.off(() => const PrProfileScreen());
    } catch (e) {
      /// Remove Loader
      PrFullScreenLoader.stopLoading();
      PrLoaders.errorSnackBar(title: 'Oh Snap !', message: e.toString());
    }
  }
}
