import 'package:flutter/material.dart';
import 'package:sber_sign_test/components/sber_buttons.dart';
import 'package:sber_sign_test/components/sber_container.dart';
import 'package:sber_sign_test/components/sber_counter.dart';
import 'package:sber_sign_test/components/sber_icons.dart';
import 'package:sber_sign_test/pages/sign_verification/widgets/load_doc_block.dart';
import 'package:sber_sign_test/styles/colors.dart';
import 'package:sber_sign_test/styles/typography.dart';

class SignVerificationBlock extends StatelessWidget {
  final Future<void> Function() pickDocument;
  final Future<void> Function() pickSignature;
  final String? fileName;
  final String? signName;

  final Future<void> Function() verifySignature;
  final double? width;
  const SignVerificationBlock({
    super.key,
    required this.pickDocument,
    required this.pickSignature,
    this.fileName,
    this.signName,
    required this.verifySignature,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SberContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SberH3Text('Проверка электронной подписи'),
                const SizedBox(height: 24),
                LoadDocWidget(
                  width: width,
                  index: 1,
                  state: fileName != null
                      ? SberCounterState.completed
                      : SberCounterState.current,
                  onPressed: pickDocument,
                  title: 'Загрузите документ',
                  description: 'Загрузите документ без штампа в формате .pdf',
                  buttonText: 'Загрузить документ',
                  docTitle: fileName,
                  docIcon: const SberIconDocDownloaded(
                    color: SberColors.electricBlue4,
                  ),
                  buttonIcon: const SberIconDownloadSm(
                    color: SberColors.electricBlue75,
                  ),
                ),
                const SizedBox(height: 24),
                LoadDocWidget(
                  width: width,
                  index: 2,
                  state: signName != null
                      ? SberCounterState.completed
                      : SberCounterState.current,
                  onPressed: pickSignature,
                  title: 'Загрузите подпись',
                  description: 'Файл подписи обычно имеет формат формат .sig',
                  buttonText: 'Загрузить подпись',
                  docTitle: signName,
                  docIcon: const SberIconDocSignedOne(
                    color: SberColors.electricBlue4,
                  ),
                  buttonIcon: const SberIconDownloadSm(
                    color: SberColors.electricBlue75,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: 480,
            child: SberPrimaryButtonLarge(
              padding: EdgeInsets.zero,
              isEnabled: signName != null && fileName != null,
              text: 'Проверить подпись',
              onPressed: verifySignature,
            ),
          ),
        ],
      ),
    );
  }
}
