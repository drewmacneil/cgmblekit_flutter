import 'package:cgmblekit_flutter/messages.dart';

extension GlucoseSampleDescription on GlucoseSample {
  DateTime date() {
    return DateTime.fromMillisecondsSinceEpoch(this.timestamp!.round() * 1000);
  }

  String description() {
    DateTime? sampleTime = timestamp != null ? date() : null;
    return '${this.quantity} mg/dL at $sampleTime';
  }
}
