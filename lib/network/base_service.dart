import 'dart:developer';

import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/route_manager.dart';
import 'package:sber_sign_test/configs/app_config.dart';
import 'package:sber_sign_test/configs/routes.dart';
import 'package:sber_sign_test/network/request_error.dart';
import 'package:sber_sign_test/network/snack_bar_state.dart';
import 'package:sber_sign_test/pages/error_page/error_controller.dart';
import 'package:sber_sign_test/tools/extentions.dart';

class BaseService {
  Dio createDio({
    required String methodName,
    bool getBytes = false,
  }) {
    var dio = Dio();
    dio.options.baseUrl = AppConfig.apiBaseUrl;
    dio.options.connectTimeout = 15000;

    dio.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));

    dio.interceptors.add(InterceptorsWrapper(onRequest: ((options, handler) {
      options.responseType = getBytes ? ResponseType.bytes : ResponseType.json;
      handler.next(options);
    })));

    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          const statusCode = null;
          // error.response?.statusCode;

          log('${error.response?.statusCode}  ${error.response?.statusMessage} ${error.response?.data}');

          if (statusCode != null && statusCode == 500) {
            await _redirectOnError(error.response!);
          } else if (statusCode != null && statusCode >= 400) {
            try {
              final Map root = error.response?.data;
              final List t = root['detail'];
              final List<Detail> errMessages =
                  t.map((item) => Detail.fromJson(item)).toList();
              var message = '';
              for (var i = 0; i < errMessages.length; i++) {
                final messg = errMessages[i].msg!.length > 1
                    ? errMessages[i].msg?.capitalize()
                    : errMessages[i].msg;
                message += '$messg \n';
              }

              await logError(
                error,
                'Error: $statusCode',
                message,
              );
            } catch (e) {
              await logError(e, 'Error: $statusCode',
                  "${error.response?.statusCode}: ${error.response?.statusMessage}");
            }
          } else {
            if (error.response == null) {
              await _redirectOnError();
            } else {
              await _redirectOnError(error.response);
            }
          }
          return handler.next(error);
        },
      ),
    );

    return dio;
  }

  Future<void> logError(Object e, String title, String message) async {
    log(message);

    SnackBarState.hideCurrentSnackBar();
    SnackBarState.showErrorSnackbar(title, message);
  }

  Future<Response> uploadFile(String path, PlatformFile file, PlatformFile sign,
      {Function(int, int)? onSendProgress}) async {
    final formData = FormData.fromMap({
      'file_1': MultipartFile.fromBytes(file.bytes!, filename: file.name),
      'file_2': MultipartFile.fromBytes(sign.bytes!, filename: sign.name)
    });
    final response = await createDio(methodName: "POST")
        .post(path, data: formData, onSendProgress: onSendProgress);
    log(response.statusCode.toString());
    return response;
  }

  // Internal methods
  Future<void> _redirectOnError([Response<dynamic>? response]) async {
    if (response?.isFailure() ?? true) {
      await Get.offAllNamed(Routes.error,
          arguments: ErrorPageParam(response?.statusCode));
    }
  }
}

extension ResponseExtensions on Response<dynamic> {
  bool _isSuccess() {
    if (statusCode == null) {
      return false;
    }
    var isSuccess = statusCode! >= 200 && statusCode! < 300;
    if (!isSuccess) {
      log("on ${requestOptions.path} response error: $statusMessage");
    }
    return isSuccess;
  }

  bool isSuccess() => _isSuccess();

  bool isFailure() => !_isSuccess();
}
