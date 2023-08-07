import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_manager/src/ui_manager_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelUiManager platform = MethodChannelUiManager();
  const MethodChannel channel = methodChannel;

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return;
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('minimize', () async {
    expect(platform.minimize(), completes);
  });
}
