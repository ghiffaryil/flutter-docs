import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_nfc_test/NfcReaderScreen.dart';
import 'package:flutter_nfc_test/scanCardNFC.txt';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  void main() async {
    runApp(const MyApp());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('NfcManager Plugin Example')),
        body: SafeArea(
          child: TextButton(
            child: const Text('OPEN NFC READER'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NfcReaderScreen()),
              );
            },
          ),
        ),
      ),
    );
  }
}
