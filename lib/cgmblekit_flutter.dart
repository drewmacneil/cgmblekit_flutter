import 'dart:async';

import 'messages.dart';

class CgmblekitFlutter {
  static CgmblekitApi _api = CgmblekitApi();

  static Future<String?> get platformVersion async {
    Version version = await _api.getPlatformVersion();
    return version.string;
  }
}
