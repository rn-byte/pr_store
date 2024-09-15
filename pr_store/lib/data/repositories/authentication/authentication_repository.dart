import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pr_store/features/authentication/screens/login/login.dart';
import 'package:pr_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:pr_store/features/authentication/screens/signup/verify_email.dart';
import 'package:pr_store/navigation_menu.dart';
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
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnboardingScreen());
    }
  }

  /*---------------------- Email and password sign-in-------------------- */

  /// [Email Authentication] - sign-in
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw PrFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw PrFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const PrFormatExceptions();
    } on PlatformException catch (e) {
      throw PrPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went Wrong, Please Try Again!';
    }
  }

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
      throw const PrFormatExceptions();
    } on PlatformException catch (e) {
      throw PrPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went Wrong, Please Try Again!';
    }
  }

  /// [Email Verification] - Mail verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw PrFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw PrFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const PrFormatExceptions();
    } on PlatformException catch (e) {
      throw PrPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went Wrong, Please Try Again!';
    }
  }

  /// [Re-authentication] - Reauthenticate user
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw PrFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw PrFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const PrFormatExceptions();
    } on PlatformException catch (e) {
      throw PrPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went Wrong, Please Try Again!';
    }
  }

  /*---------------------- Federated identity and social sign-in-------------------- */
  ///[Google Authentication] - Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      /// Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      /// Obtain the Auth Details from the Request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      ///Create a new Credentials
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      /// Once Signed in , Return the user credentials
      return await _auth.signInWithCredential(credentials);

      ///
      ///
    } on FirebaseAuthException catch (e) {
      throw PrFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw PrFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const PrFormatExceptions();
    } on PlatformException catch (e) {
      throw PrPlatformExceptions(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went Wrong. $e');
      throw 'Something went Wrong, Please Try Again!';
    }
  }

  ///[Facebook Authentication]- Facebook

  /*----------------------end of Federated identity and social sign-in-------------------- */
  /// [Logout User]- Valid for any Authentication
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await _auth.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw PrFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw PrFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const PrFormatExceptions();
    } on PlatformException catch (e) {
      throw PrPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went Wrong, Please Try Again!';
    }
  }

  /// [ Delete user]- Remove User Auth and Firebase account
}
