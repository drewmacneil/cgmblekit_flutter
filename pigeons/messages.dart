import 'package:pigeon/pigeon.dart';

class Version {
  String? string;
}

class Transmitter {
  String? id;
}

class GlucoseSample {
  // TODO: bring in the other fields.
  double? quantity;
}

@HostApi()
abstract class Api {
  void listenForTransmitter(Transmitter transmitter);
  Version getPlatformVersion();
}

@FlutterApi()
abstract class CallbackApi {
  void newSample(GlucoseSample glucoseSample);
}
