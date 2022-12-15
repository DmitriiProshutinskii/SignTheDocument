import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle, Uint8List;
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart' as get_;
import 'package:mockito/mockito.dart';
import 'package:sber_sign_test/network/base_service.dart';
import 'package:sber_sign_test/network/sber_response.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  get_.Get.testMode = true;

  test('Sent to the server good stuff', () async {
    final Uint8List? fileData = await readFile();
    final Uint8List? signData = await readSign();

    final service = BaseService();
    final result = await service.uploadFile(
      'public/verify/signature',
      fileData!,
      'pdf_sample_2.pdf',
      signData!,
      'Подпи.sig',
    );

    final res = SberResponse.fromJson(result.data);
    expect(res.success, true);
  });
}

const path = '/Users/koptehe/Downloads/Комплект_документов_bbed53a752de';
Future<File> get _localSign async {
  return File('$path/Подпись_df18b6124eb8_Акакий_Башмачкин.sig');
}

Future<File> get _localFile async {
  return File('$path/pdf_sample_2.pdf');
}

Future<Uint8List?> readFile() async {
  try {
    final file = await _localFile;

    // Read the file
    final contents = await file.readAsBytes();

    return contents;
  } catch (e) {
    // If encountering an error, return 0
    log(e.toString());
    return null;
  }
}

Future<Uint8List?> readSign() async {
  try {
    final file = await _localSign;

    // Read the file
    final contents = await file.readAsBytes();

    return contents;
  } catch (e) {
    // If encountering an error, return 0
    log(e.toString());
    return null;
  }
}
