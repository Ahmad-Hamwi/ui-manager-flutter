import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_manager/ui_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> minimize() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      await UiManager.minimize();
    } on PlatformException {
      // Failed, failure will be printed in console on debug builds
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('UI Manager Plugin example app'),
        ),
        body: Center(
          child: OutlinedButton(
            child: const Text("Minimize App"),
            onPressed: () async => minimize(),
          ),
        ),
      ),
    );
  }
}
