// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_manager_example/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('sendToBackground works', (WidgetTester tester) async {
    // arrange
    await tester.pumpWidget(const MyApp());
    bool isInBackground = false;

    // act
    SystemChannels.lifecycle.setMessageHandler((message) async {
      if (message == AppLifecycleState.paused.toString()) {
        isInBackground = true;
      }
      return null;
    });

    await tester.tap(find.byType(OutlinedButton));

    // assert
    expect(isInBackground, true);
  });
}
