import 'dart:developer';

import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sber_sign_test/configs/app_config.dart';
import 'package:sber_sign_test/network/request_error.dart';
import 'package:sber_sign_test/network/snack_bar_state.dart';
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
          final statusCode = error.response?.statusCode;

          log('${error.response?.statusCode}  ${error.response?.statusMessage} ${error.response?.data}');

          if (statusCode != null && statusCode == 500) {
            await logError(
              error,
              'Error: $statusCode',
              'Iternal Server Error',
            );
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
              await logError(error, 'Connection error',
                  'Failed to connect to the server. Please check your internet connection and try again');
            } else {
              await logError(error, 'Error: $statusCode',
                  '${error.response?.statusCode}: ${error.response?.statusMessage}');
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
}
