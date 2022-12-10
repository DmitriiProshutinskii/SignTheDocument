import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' as G;
import 'package:sber_sign_test/network/sber_response.dart';
import 'package:sber_sign_test/pages/sign_verification/sign_verification_service.dart';

class SignVerificationController extends G.GetxController {
  String? fileName;
  String? signName;

  PlatformFile? _docPaths;
  PlatformFile? _signPaths;

  String? _extension;
  bool _isLoading = false;
  bool _userAborted = false;

  bool _isSendButtonEnale = false;
  bool get isSendButtonEnable => _isSendButtonEnale;

  bool? isVerifided;
  SberResponse _response = SberResponse();
  SberResponse get response => _response;

  final FileType _pickingType = FileType.any;

  Future<void> pickDocument() async {
    _isLoading = true;
    _userAborted = false;

    try {
      final paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: false,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
      if (paths?.isNotEmpty ?? false) {
        _docPaths = paths!.first;
      }
    } on PlatformException catch (e) {
      _logException('Unsupported operation$e');
    } catch (e) {
      _logException(e.toString());
    } finally {
      _isLoading = false;
    }

    fileName = _docPaths?.name.toString();
    _userAborted = _docPaths == null;

    _isSendButtonEnale = _docPaths != null && _signPaths != null;
    update();
  }

  Future<void> pickSignature() async {
    _isLoading = true;
    _userAborted = false;

    update();
    try {
      final paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: false,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
      if (paths?.isNotEmpty ?? false) {
        _signPaths = paths!.first;
      }
    } on PlatformException catch (e) {
      _logException('Unsupported operation$e');
    } catch (e) {
      _logException(e.toString());
    } finally {
      _isLoading = false;
    }
    signName = _signPaths?.name.toString();
    _userAborted = _signPaths == null;

    _isSendButtonEnale = _docPaths != null && _signPaths != null;
    update();
  }

  Future<void> verifySignature() async {
    if (_signPaths != null && _docPaths != null) {
      try {
        final res =
            await SignVerificationService.verifySign(_docPaths!, _signPaths!);
        log((res != null).toString());
        if (res != null) {
          isVerifided = res.success;
          _response = res;
          update();
        }
      } catch (e) {
        log(e.toString());
      }
    }
  }

  void _logException(String message) {
    log(message);
  }
}
