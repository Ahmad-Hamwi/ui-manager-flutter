import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:ui_manager/src/ui_manager.dart';
import 'package:ui_manager/src/ui_manager_method_channel.dart';
import 'package:ui_manager/src/ui_manager_platform_interface.dart';

class MockUiManagerPlatform
    with MockPlatformInterfaceMixin
    implements UiManagerPlatform {
  @override
  Future<void> minimize() async {}
}

void main() {
  final UiManagerPlatform initialPlatform = UiManagerPlatform.instance;

  test('$MethodChannelUiManager is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelUiManager>());
  });

  test('calling minimize in the plugin completes', () async {
    // arrange
    UiManagerPlatform.instance = MockUiManagerPlatform();

    // act
    final future = UiManager.minimize();

    // assert
    expect(future, completes);
  });
}
