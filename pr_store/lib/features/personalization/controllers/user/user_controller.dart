import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pr_store/data/repositories/authentication/authentication_repository.dart';
import 'package:pr_store/data/repositories/users/user_repository.dart';
import 'package:pr_store/features/authentication/screens/login/login.dart';
import 'package:pr_store/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:pr_store/utils/constants/image_strings.dart';
import 'package:pr_store/utils/constants/sizes.dart';
import 'package:pr_store/utils/popups/full_screen_loader.dart';
import 'package:pr_store/utils/popups/loaders.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../authentication/models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = false.obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  final imageUploading = false.obs;

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
      /// First update the Rx user and then check if user data is already stored. if not, then store new data
      await fetchUserRecord();

      /// If no record already stored
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          /// Convert name to First and last name
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredentials.user!.displayName ?? '');

          /// Map Data
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            userName: username,
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          /// save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      PrLoaders.errorSnackBar(
          title: 'Data not Saved',
          message:
              'Something went wrong while saving your information. You can re-save your data from your profile');
    }
  }

  /// Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(PrSizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: PrSizes.lg),
            child: Text('Delete'),
          ),
        ),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')));
  }

  /// Delete User Account
  void deleteUserAccount() async {
    try {
      /// start Loading
      PrFullScreenLoader.openLoadingDialog(
          'Processing..', PrImage.docerAnimation);

      /// First Re-authenticate User
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        /// Re verify auth email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          PrFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          PrFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthUserLoginForm());
        }
      }
    } catch (e) {
      PrFullScreenLoader.stopLoading();
      PrLoaders.errorSnackBar(title: 'Oh Snap !', message: e.toString());
    }
  }

  /// Re- authenticate before deleting
  Future<void> reAuthEmailAndPassUser() async {
    try {
      PrFullScreenLoader.openLoadingDialog(
          'Processing... ', PrImage.docerAnimation);

      /// Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PrFullScreenLoader.stopLoading();
        return;
      }

      ///Re-auth FormKey
      if (!reAuthFormKey.currentState!.validate()) {
        PrFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      PrFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      PrFullScreenLoader.stopLoading();
      PrLoaders.errorSnackBar(title: 'Oh Snap !', message: e.toString());
    }
  }

  /// Upload Profile Image
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);

      if (image != null) {
        imageUploading.value = true;
        final imageUrl =
            await userRepository.uploadImage('Users/Image/Profile/', image);

        /// upload user image record
        Map<String, dynamic> json = {'profilePicture': imageUrl};

        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();

        //success snackBar
        PrLoaders.successSnackBar(
            title: 'Congratulations!',
            message: 'Your profile picture has been updated.');
      }
    } catch (e) {
      PrLoaders.errorSnackBar(
          title: 'Oh Snap !', message: 'Something went wrong ! : $e');
    } finally {
      imageUploading.value = false;
    }
  }
}
