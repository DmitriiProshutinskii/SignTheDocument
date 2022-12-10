import 'package:get/get.dart';
import 'package:sber_sign_test/pages/sign_verification/sign_verification_controller.dart';

class SignVerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignVerificationController>(() => SignVerificationController());
  }
}
