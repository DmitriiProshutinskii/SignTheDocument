import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle, Uint8List;
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart' as get_;
import 'package:sber_sign_test/network/base_service.dart';
import 'package:sber_sign_test/network/sber_response.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  get_.Get.testMode = true;
  test('Sent to the server good stuff', () async {
    Uint8List? fileData;
    Uint8List? signData;

    await rootBundle
        .load('assets/test_files/pdf_sample_2.pdf')
        .then((data) => fileData = data.buffer.asUint8List());
    await rootBundle
        .load('assets/test_files/Подпись_df18b6124eb8_Акакий_Башмачкин.sig')
        .then((data) => signData = data.buffer.asUint8List());

    final formData = FormData.fromMap({
      'file_1': MultipartFile.fromBytes(fileData!, filename: 'file'),
      'file_2': MultipartFile.fromBytes(signData!, filename: 'sign')
    });
    final response = await BaseService()
        .createDio(methodName: "POST")
        .post('public/verify/signature', data: formData);

    final res = SberResponse.fromJson(response.data);
    expect(res.success, true);
  });
}
