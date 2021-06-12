import 'dart:async';

import 'messages.dart';

class CgmblekitFlutter {
  static Api _api = Api();

  static Future<void> listenForTransmitter(
      String id, Function(GlucoseSample gs) cb) async {
    CallbackApi.setup(CallbackApiImpl(cb));
    return await _api.listenForTransmitter(Transmitter()..id = id);
  }

  static Future<String?> get platformVersion async {
    Version version = await _api.getPlatformVersion();
    return version.string;
  }
}

class CallbackApiImpl extends CallbackApi {
  final Function(GlucoseSample glucoseSample) caller;

  CallbackApiImpl(this.caller);

  @override
  void newSample(GlucoseSample glucoseSample) {
    this.caller(glucoseSample);
  }
}
