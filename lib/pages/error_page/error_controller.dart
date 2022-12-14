import 'package:get/get.dart';
import 'package:sber_sign_test/configs/routes.dart';
import 'package:sber_sign_test/pages/error_page/error_texts_repository.dart';

class ErrorController extends GetxController {
  final ErrorPageRepository repository;
  ErrorController(this.repository);

  ErrorPageData? _data;
  int? _statusCode;
  int? get statusCode => _statusCode;
  String get title => _data?.title ?? '';
  String get description => _data?.description ?? '';

  @override
  void onInit() {
    final params = Get.arguments as ErrorPageParam?;
    if (params != null) {
      _statusCode = params.statusCode;
    }
    _data = repository.data(_statusCode);
    super.onInit();
    update();
  }

  Future<void> backToMain() async {
    Get.offAllNamed(Routes.initial);
  }
}

class ErrorPageParam {
  final int? statusCode;

  ErrorPageParam(this.statusCode);
}
