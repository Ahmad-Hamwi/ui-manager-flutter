import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../src/ui_manager_method_channel.dart';

abstract class UiManagerPlatform extends PlatformInterface {
  /// Constructs a UiManagerPlatform.
  UiManagerPlatform() : super(token: _token);

  static final Object _token = Object();

  static UiManagerPlatform _instance = MethodChannelUiManager();

  /// The default instance of [UiManagerPlatform] to use.
  ///
  /// Defaults to [MethodChannelUiManager].
  static UiManagerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UiManagerPlatform] when
  /// they register themselves.
  static set instance(UiManagerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> minimize();
}
