import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart' as get_;
import 'package:sber_sign_test/components/sber_counter.dart';
import 'package:sber_sign_test/components/sber_icons.dart';
import 'package:sber_sign_test/components/sber_verification_info.dart';
import 'package:sber_sign_test/network/sber_response.dart';
import 'package:sber_sign_test/pages/sign_verification/sign_verification_page.dart';
import 'package:sber_sign_test/pages/sign_verification/widgets/load_doc_block.dart';

import 'package:sber_sign_test/styles/colors.dart';
import 'package:sber_sign_test/styles/typography.dart';

void main() {
  get_.Get.testMode = true;

  testWidgets('Find text in a LoadDocWidget without doc file name',
      (WidgetTester tester) async {
    // given
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

    // when
    await tester.pumpWidget(w);

    final titleFinder = find.text('Загрузите подпись');
    final buttonFinder = find.bySubtype<SberIconDownloadSm>();
    final counterFinder = find.bySubtype<SberCounter>();

    // then
    expect(titleFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
    expect(counterFinder, findsOneWidget);
  });

  testWidgets('Entrance screen without picked files',
      (WidgetTester tester) async {
    final Widget widget = MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: SignVerificationBody(
            response: SberResponse(),
            fileName: null,
            signName: null,
            verifySignature: () async {},
            pickDocument: () async {},
            pickSignature: () async {},
          ),
        ),
      ),
    );

    // when
    await tester.pumpWidget(widget);

    final titleFinder = find.text('Загрузите подпись');
    final buttonFinder = find.bySubtype<SberIconDownloadSm>();
    final counterFinder = find.bySubtype<SberCounter>();

    // then
    expect(titleFinder, findsOneWidget);
    expect(buttonFinder, findsWidgets);
    expect(counterFinder, findsWidgets);
  });

  testWidgets('Entrance screen with picked only sign',
      (WidgetTester tester) async {
    final Widget widget = MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: SignVerificationBody(
            response: SberResponse(),
            fileName: null,
            signName: 'Sign file',
            verifySignature: () async {},
            pickDocument: () async {},
            pickSignature: () async {},
          ),
        ),
      ),
    );

    // when
    await tester.pumpWidget(widget);

    final titleFinder = find.text('Загрузите подпись');
    final buttonFinder = find.bySubtype<SberIconDownloadSm>();
    final counterFinder = find.bySubtype<SberCounter>();

    // then
    expect(titleFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
    expect(counterFinder, findsWidgets);
  });

  testWidgets('Success screen content test', (WidgetTester tester) async {
    // given
    final SberResponse response = SberResponse(
      errorCode: 0,
      errorComment: '',
      errorDetails: '',
      errorTrace: '',
      success: true,
      signatureTimeMsk: '07 декабря 2022 г. 14:40 МСК',
      signerFullName: 'Акакий Башмачкин',
      signerInn: '159753456719',
      signatureGuid: 'df18b6124eb8',
      documentOriginGuid: 'bbed53a752de',
      keyGuid: '1c6b3d32f128',
    );
    final Widget widget = MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: SignVerificationBody(
            response: response,
            fileName: null,
            signName: null,
            verifySignature: () async {},
            pickDocument: () async {},
            pickSignature: () async {},
          ),
        ),
      ),
    );

    // when
    await tester.pumpWidget(widget);

    final titleFinder = find.text('Протокол проверки \nэлектронной подписи');
    final buttonFinder = find.bySubtype<SberInfoAlertSuccess>();
    final fullNameFinder = find.text('Акакий Башмачкин');

    // then
    expect(titleFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
    expect(fullNameFinder, findsOneWidget);
  });

  testWidgets('Fail screen content test', (WidgetTester tester) async {
    // given
    final SberResponse response = SberResponse(
      errorCode: 0,
      errorComment: '',
      errorDetails: '',
      errorTrace: '',
      success: false,
    );
    final Widget widget = MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: SignVerificationBody(
            response: response,
            fileName: null,
            signName: null,
            verifySignature: () async {},
            pickDocument: () async {},
            pickSignature: () async {},
          ),
        ),
      ),
    );

    // when
    await tester.pumpWidget(widget);

    final titleFinder = find.text('Протокол проверки \nэлектронной подписи');
    final buttonFinder = find.bySubtype<SberInfoAlertFailed>();
    final errorsTitleFinder = find.text('Возможные причины ошибки:');
    final errorTextFinder = find.text('1. Документ был изменен\n'
        '2. Электронная подпись была создана для другого документа\n'
        '3. Электронная подпись была изменена\n'
        '4. Электронная подпись была создана в другом сервисе.');
    final textTypeFinder = find.byType(SberB3Text);

    // then
    expect(titleFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
    expect(errorsTitleFinder, findsOneWidget);
    expect(errorTextFinder, findsOneWidget);
    expect(textTypeFinder, findsOneWidget);
  });

  testWidgets('Fail screen codsntent test', (WidgetTester tester) async {
    final Widget widget = MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: SignVerificationBody(
            response: SberResponse(),
            fileName: null,
            signName: null,
            verifySignature: () async {},
            pickDocument: () async {},
            pickSignature: () async {},
          ),
        ),
      ),
    );
    // when
    await tester.pumpWidget(widget);

    final titleFinder = find.text('Загрузите подпись');

    // then
    expect(titleFinder, findsOneWidget);
  });
}
