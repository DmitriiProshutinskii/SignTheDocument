import 'package:flutter/material.dart';
import 'package:sber_sign_test/components/sber_container.dart';
import 'package:sber_sign_test/network/sber_response.dart';
import 'package:sber_sign_test/styles/typography.dart';

import '../../../components/sber_verification_info.dart';

class SignVerificationSuccess extends StatelessWidget {
  final SberResponse response;
  final double? width;
  final ScrollController controller = ScrollController();
  SignVerificationSuccess({super.key, required this.response, this.width});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 40),
      child: SizedBox(
        width: width,
        child: SberContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SberH3Text(
                'Протокол проверки \nэлектронной подписи',
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const SberInfoAlertSuccess(),
              const SizedBox(height: 24),
              SizedBox(
                width: 456,
                height: size.height < 656 ? size.height - 356 : 300,
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: controller,
                  thickness: 4,
                  child: ListView(
                    controller: controller,
                    shrinkWrap: true,
                    children: [
                      const SberH4Text('Основная информация'),
                      const SizedBox(height: 16),
                      _Line(
                        title: 'ФИО подписанта',
                        value: response.signerFullName!,
                      ),
                      _Line(
                        title: 'ИНН Подписанта',
                        value: response.signerInn!,
                      ),
                      _Line(
                          title: 'Дата подписания',
                          value: response.signatureTimeMsk!),
                      _Line(
                          title: 'ID Документа',
                          value: response.documentOriginGuid!),
                      _Line(title: 'ID Ключа', value: response.keyGuid!),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Line extends StatelessWidget {
  final String title;
  final String value;
  const _Line({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SberH6Text(title),
        const SizedBox(height: 2),
        SberB3Text(value),
        const SizedBox(height: 8),
      ],
    );
  }
}
