import 'package:flutter/services.dart';

import '../src/ui_manager_platform_interface.dart';

/// The method channel used to interact with the native platform.
const methodChannel = MethodChannel('io.github.ahmad_hamwi/ui_manager');

/// An implementation of [UiManagerPlatform] that uses method channels.
class MethodChannelUiManager extends UiManagerPlatform {
  @override
  Future<void> minimize() async {
    await methodChannel.invokeMethod('minimize');
  }
}
