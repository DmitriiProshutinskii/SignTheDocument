import 'package:flutter/material.dart';
import 'package:sber_sign_test/components/sber_container.dart';
import 'package:sber_sign_test/styles/colors.dart';
import 'package:sber_sign_test/styles/typography.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Сбер-Подпись')),
      body: Center(
        child: SberContainer(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              '404',
              style: TextStyle(
                fontSize: 120,
                fontWeight: FontWeight.w900,
                color: SberColors.electricBlue75,
              ),
            ),
            SizedBox(height: 2),
            SberH3Text('Страница не найдена'),
            SberB1Text(
              'Мы не смогли найти данную страницу.',
              color: SberColors.mainGray,
            )
          ],
        )),
      ),
    );
  }
}
