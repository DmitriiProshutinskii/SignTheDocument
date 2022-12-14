import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sber_sign_test/components/sber_buttons.dart';
import 'package:sber_sign_test/pages/sign_verification/widgets/sign_verification_block.dart';
import 'package:sber_sign_test/styles/typography.dart';

void main() {
  testWidgets('Test of Text', (WidgetTester tester) async {
    const Widget widget = MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(body: Center(child: SberB1Text('Text'))));
    await tester.pumpWidget(widget);

    final titleFinder = find.text('Text');
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('MyWidget has a title, message and button texts',
      (WidgetTester tester) async {
    const widget = MyWidget();
    await tester.pumpWidget(widget);

    // Create the Finders.
    final titleFinder = find.text('Проверка электронной подписи');
    final messageFinder = find.text('Загрузите документ');
    final message2Finder = find.text('Загрузите подпись');
    final button1Finder = find.byType(SberSecondaryButtonSm);

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
    expect(message2Finder, findsOneWidget);
    expect(button1Finder, findsWidgets);
  });
}

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SignVerificationBlock(
                verifySignature: () async => {},
                pickDocument: () async => {},
                pickSignature: () async => {},
                isSendButtonEnable: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
