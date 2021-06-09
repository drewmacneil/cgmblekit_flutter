import 'package:pigeon/pigeon.dart';

class Version {
  String? string;
}

@HostApi()
abstract class CgmblekitApi {
  Version getPlatformVersion();
}
