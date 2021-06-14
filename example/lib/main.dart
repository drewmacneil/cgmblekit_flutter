import 'package:cgmblekit_flutter/messages.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:cgmblekit_flutter/cgmblekit_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlucoseSample? _latestGlucoseSample;

  @override
  void initState() {
    super.initState();
    initCGM();
  }

  Future<void> initCGM() async {
    await CgmblekitFlutter.listenForTransmitter(
        "8NA0LY", this.updateLatestGlucoseReading);
  }

  void updateLatestGlucoseReading(GlucoseSample glucoseSample) {
    setState(() {
      _latestGlucoseSample = glucoseSample;
    });
  }

  String _latestGlucoseSampleDescription() {
    if (_latestGlucoseSample == null) {
      return 'Unknown';
    }
    DateTime sampleTime = DateTime.fromMillisecondsSinceEpoch(
        _latestGlucoseSample!.timestamp!.round() * 1000);
    return '${_latestGlucoseSample!.quantity} mg/dL at $sampleTime';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('cgmblekit_flutter example'),
        ),
        body: Center(
          child: Text('Latest glucose: ${_latestGlucoseSampleDescription()}'),
        ),
      ),
    );
  }
}
