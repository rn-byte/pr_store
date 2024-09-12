import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pr_store/features/authentication/screens/login/login.dart';
import 'package:pr_store/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();

  /// Called from Main.dart on App Run
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show relevant screen
  screenRedirect() async {
    ///Local Storage
    ///
    if (kDebugMode) {
      print('<-------------Get Storage-AUTHENTICATION----------------->');
      print(deviceStorage.read('IsFirstTime'));
    }
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnboardingScreen());
  }

  /*---------------------- Email and password sign-in-------------------- */

  /// [Email Authentication] - sign-in
  /// [Email Authentication] - Register
  /// [Re-authentication] - Reauthenticate user
  /// [Email Verification] - Mail verification

  /*---------------------- Federated identity and social sign-in-------------------- */
  ///[Google Authentication] - Google
  ///[Facebook Authentication]- Facebook

  /*----------------------end of Federated identity and social sign-in-------------------- */
  /// [Logout User]- Valid for any Authentication
  /// [ Delete user]- Remove User Auth and Firebase account
}
