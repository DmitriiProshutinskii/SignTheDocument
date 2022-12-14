import 'package:flutter/material.dart';
import 'package:sber_sign_test/components/app_bar/sber_app_bar.dart';
import 'package:sber_sign_test/network/sber_response.dart';
import 'package:sber_sign_test/pages/sign_verification/sign_verification_controller.dart';
import 'package:sber_sign_test/pages/sign_verification/widgets/sign_verification_block.dart';

import 'package:get/get.dart';
import 'package:sber_sign_test/pages/sign_verification/widgets/sign_verification_fail.dart';
import 'package:sber_sign_test/pages/sign_verification/widgets/sign_verification_success.dart';
import 'package:sber_sign_test/styles/colors.dart';

class SignVerificationPage extends GetView<SignVerificationController> {
  const SignVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SberColors.snowSber,
      appBar: const SberAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GetBuilder<SignVerificationController>(
              builder: (SignVerificationController controller) {
                // return SignVerificationBody(
                //   isVerifided: controller.isVerifided,
                //   response: controller.response,
                //   fileName: controller.fileName,
                //   signName: controller.signName,
                //   verifySignature: controller.verifySignature,
                //   pickDocument: controller.pickDocument,
                //   pickSignature: controller.pickSignature,
                //   isSendButtonEnable: controller.isSendButtonEnable,
                // );

                if (controller.isVerifided ?? false) {
                  return SignVerificationSuccess(
                    response: controller.response,
                  );
                }
                if (!(controller.isVerifided ?? true)) {
                  return SignVerificationFail(
                    response: controller.response,
                  );
                }
                return SignVerificationBlock(
                  fileName: controller.fileName,
                  signName: controller.signName,
                  verifySignature: controller.verifySignature,
                  pickDocument: controller.pickDocument,
                  pickSignature: controller.pickSignature,
                  isSendButtonEnable: controller.isSendButtonEnable,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SignVerificationBody extends StatelessWidget {
  final bool? isVerifided;
  final SberResponse response;
  final String? fileName;
  final String? signName;
  final Future<void> Function() verifySignature;
  final Future<void> Function() pickDocument;
  final Future<void> Function() pickSignature;
  final bool isSendButtonEnable;
  const SignVerificationBody(
      {super.key,
      required this.isVerifided,
      required this.response,
      required this.fileName,
      required this.signName,
      required this.verifySignature,
      required this.pickDocument,
      required this.pickSignature,
      required this.isSendButtonEnable});

  @override
  Widget build(BuildContext context) {
    if (isVerifided ?? false) {
      return SignVerificationSuccess(
        response: response,
      );
    }
    if (!(isVerifided ?? true)) {
      return SignVerificationFail(
        response: response,
      );
    }
    return SignVerificationBlock(
      fileName: fileName,
      signName: signName,
      verifySignature: verifySignature,
      pickDocument: pickDocument,
      pickSignature: pickSignature,
      isSendButtonEnable: isSendButtonEnable,
    );
  }
}
