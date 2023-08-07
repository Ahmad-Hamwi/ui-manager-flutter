import 'ui_manager_platform_interface.dart';

class UiManager {
  static Future<void> minimize() {
    return UiManagerPlatform.instance.minimize();
  }

  UiManager._();
}
