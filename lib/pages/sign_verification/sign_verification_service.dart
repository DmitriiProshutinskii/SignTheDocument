import 'package:file_picker/file_picker.dart';
import 'package:sber_sign_test/network/base_service.dart';
import 'package:sber_sign_test/network/sber_response.dart';

class SignVerificationService {
  static Future<SberResponse?> verifySign(
      PlatformFile file, PlatformFile sign) async {
    final service = BaseService();
    final result = await service.uploadFile(
      'public/verify/signature',
      file.bytes!,
      file.name,
      sign.bytes!,
      sign.name,
    );
    if (result.statusCode == 200) {
      return SberResponse.fromJson(result.data);
    }
    return null;
  }
}
