import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// send email whenever verify screen appears and set timer for auto redirect

  @override
  void onInit() {
    super.onInit();
  }

  /// Send Email Verification Link
  /// Timer to automatically redirect on email verification
  /// Manually check if email is verified
}
