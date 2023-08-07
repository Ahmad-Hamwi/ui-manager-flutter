import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ui_manager_example/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'minimize works on a full load of a flutter app',
    (WidgetTester tester) async {
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
      await tester.pump();

      // assert
      expect(isInBackground, true);
    },
  );
}
