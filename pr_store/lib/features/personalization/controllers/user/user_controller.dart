import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pr_store/data/repositories/users/user_repository.dart';
import 'package:pr_store/utils/popups/loaders.dart';

import '../../../authentication/models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch User Record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  ///Save User Record from any registration provieder
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        /// Convert name to First and last name
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        /// Map Data
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          userName: username,
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        /// save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      PrLoaders.errorSnackBar(
          title: 'Data not Saved',
          message:
              'Something went wrong while saving your information. You can re-save your data from your profile');
    }
  }
}
