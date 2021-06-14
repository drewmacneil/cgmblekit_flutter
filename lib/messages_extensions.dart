import 'package:cgmblekit_flutter/messages.dart';

extension GlucoseSampleDescription on GlucoseSample {
  String description() {
    DateTime? sampleTime = timestamp != null
        ? DateTime.fromMillisecondsSinceEpoch(this.timestamp!.round() * 1000)
        : null;
    return '${this.quantity} mg/dL at $sampleTime';
  }
}
