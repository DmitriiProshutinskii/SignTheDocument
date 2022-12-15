import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart' as get_;
import 'package:sber_sign_test/styles/typography.dart';

void main() {
  get_.Get.testMode = true;
  testWidgets('Test of SberB1Text', (WidgetTester tester) async {
    // given
    const Widget widget = MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(body: Center(child: SberB1Text('Text'))));

    // when
    await tester.pumpWidget(widget);

    //then
    final titleFinder = find.text('Text');
    expect(titleFinder, findsOneWidget);
  });
}
