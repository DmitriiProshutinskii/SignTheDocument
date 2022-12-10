import 'dart:developer';

import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sber_sign_test/configs/app_config.dart';
import 'package:sber_sign_test/network/request_error.dart';
import 'package:sber_sign_test/network/snack_bar_state.dart';

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

          if (statusCode != null && statusCode >= 400) {
            try {
              final Map root = error.response?.data;
              final List t = root['errors'];

              final List<ErrorMessage> errMessages =
                  t.map((item) => ErrorMessage.fromJson(item)).toList();
              var message = '';
              for (var i = 0; i < errMessages.length; i++) {
                final path = errMessages[i].path.contains('\$.')
                    ? errMessages[i].path.replaceFirst('\$.', '')
                    : errMessages[i].path;
                final path_ = path.length > 1
                    ? "${path[0].toUpperCase()}${path.substring(1).toLowerCase()}"
                    : path;

                final messg = errMessages[i].message.length > 1
                    ? "${errMessages[i].message[0].toUpperCase()}${errMessages[i].message.substring(1).toLowerCase()}"
                    : errMessages[i].message;
                if (path_.isNotEmpty) {
                  message += '$path_: ';
                }

                message += '$messg \n';
              }

              await logError(
                error,
                message,
              );
            } catch (e) {
              await logError(e,
                  "${error.response?.statusCode}: ${error.response?.statusMessage}");
            }
          } else {
            if (error.response == null) {
              await logError(error,
                  'Failed to connect to the server. Please check your internet connection and try again');
            } else {
              await logError(error,
                  '${error.response?.statusCode}: ${error.response?.statusMessage}');
            }
          }
          return handler.next(error);
        },
      ),
    );

    return dio;
  }

  Future<void> logError(Object e, String message) async {
    log(message);

    SnackBarState.hideCurrentSnackBar();
    SnackBarState.showErrorSnackbar(message);
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
