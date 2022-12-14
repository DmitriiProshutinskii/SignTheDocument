import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sber_sign_test/components/sber_counter.dart';
import 'package:sber_sign_test/components/sber_icons.dart';
import 'package:sber_sign_test/pages/sign_verification/widgets/load_doc_block.dart';

import 'package:sber_sign_test/styles/colors.dart';
import 'package:sber_sign_test/styles/typography.dart';

void main() {
  testWidgets('Test of SberB1Text', (WidgetTester tester) async {
    const Widget widget = MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(body: Center(child: SberB1Text('Text'))));
    await tester.pumpWidget(widget);

    final titleFinder = find.text('Text');
    expect(titleFinder, findsOneWidget);
  });
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Find text in a LoadDocWidget without doc file name',
      (WidgetTester tester) async {
    final Widget w = MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: LoadDocWidget(
            index: 1,
            state: SberCounterState.current,
            onPressed: () async => {},
            title: 'Загрузите подпись',
            description: 'Файл подписи обычно имеет формат формат .sig',
            buttonText: 'Загрузить подпись',
            docIcon: const SberIconDocSignedOne(
              color: SberColors.electricBlue4,
            ),
            buttonIcon: const SberIconDownloadSm(
              color: SberColors.electricBlue75,
            ),
          ),
        ),
      ),
    );

    await tester.pumpWidget(w);
    final titleFinder = find.text('Загрузите подпись');

    expect(titleFinder, findsOneWidget);
  });
}
