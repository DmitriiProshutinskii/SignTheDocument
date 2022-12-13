import 'package:flutter/material.dart';
import 'package:sber_sign_test/components/app_bar/sber_app_bar.dart';
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
