import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pr_store/features/authentication/screens/login/login.dart';
import 'package:pr_store/features/authentication/screens/onboarding/onboarding.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

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
    // if (kDebugMode) {
    //   print('<-------------Get Storage-AUTHENTICATION----------------->');
    //   print(deviceStorage.read('IsFirstTime'));
    // }
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnboardingScreen());
  }

  /*---------------------- Email and password sign-in-------------------- */

  /// [Email Authentication] - sign-in
  /// [Email Authentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw PrFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw PrFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw PrFormatExceptions();
    } on PlatformException catch (e) {
      throw PrPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went Wrong, Please Try Again!';
    }
  }

  /// [Re-authentication] - Reauthenticate user
  /// [Email Verification] - Mail verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw PrFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw PrFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw PrFormatExceptions();
    } on PlatformException catch (e) {
      throw PrPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went Wrong, Please Try Again!';
    }
  }

  /*---------------------- Federated identity and social sign-in-------------------- */
  ///[Google Authentication] - Google
  ///[Facebook Authentication]- Facebook

  /*----------------------end of Federated identity and social sign-in-------------------- */
  /// [Logout User]- Valid for any Authentication
  /// [ Delete user]- Remove User Auth and Firebase account
}
