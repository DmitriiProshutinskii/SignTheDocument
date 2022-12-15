import 'package:flutter/material.dart';
import 'package:sber_sign_test/components/sber_container.dart';
import 'package:sber_sign_test/components/sber_verification_info.dart';
import 'package:sber_sign_test/network/sber_response.dart';
import 'package:sber_sign_test/styles/typography.dart';

class SignVerificationFail extends StatelessWidget {
  final SberResponse response;
  final double? width;
  final ScrollController controller = ScrollController();
  SignVerificationFail({super.key, required this.response, this.width});

  @override
  Widget build(BuildContext context) {
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
              const SberInfoAlertFailed(),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SberH5Text('Возможные причины ошибки:'),
                  Row(children: const [SizedBox(height: 8)]),
                  const SberB3Text(
                    '1. Документ был изменен\n'
                    '2. Электронная подпись была создана для другого документа\n'
                    '3. Электронная подпись была изменена\n'
                    '4. Электронная подпись была создана в другом сервисе.',
                    maxLines: 5,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
