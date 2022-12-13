import 'package:get/get.dart';
import 'package:sber_sign_test/pages/error_page/error_controller.dart';
import 'package:sber_sign_test/pages/error_page/error_texts_repository.dart';

class ErrorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ErrorController>(() => ErrorController(ErrorPageRepository()));
  }
}
