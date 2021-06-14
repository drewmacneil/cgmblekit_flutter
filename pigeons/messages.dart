import 'package:pigeon/pigeon.dart';

class Version {
  String? string;
}

class Transmitter {
  String? id;
}

class GlucoseSample {
  // TODO: bring in the other fields.
  // Seconds since epoch.
  double? timestamp;
  // Glucose value in mg/dL.
  //   TODO: does the transmitter always return values in this unit?
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
