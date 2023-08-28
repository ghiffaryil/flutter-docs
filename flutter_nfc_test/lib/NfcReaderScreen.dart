import 'package:flutter/material.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';

class NfcReaderScreen extends StatefulWidget {
  @override
  _NfcReaderScreenState createState() => _NfcReaderScreenState();
}

class _NfcReaderScreenState extends State<NfcReaderScreen> {
  String _tagData = '';

  @override
  void initState() {
    super.initState();
    _startNfc();
  }

  @override
  void dispose() {
    _stopNfc();
    super.dispose();
  }

  Future<void> _startNfc() async {
    try {
      FlutterNfcReader.onTagDiscovered().listen((NfcData data) {
        setState(() {
          _tagData = data.content!;
        });
      });
    } catch (e) {
      print('Error starting NFC session: $e');
    }
  }

  Future<void> _stopNfc() async {
    try {
      FlutterNfcReader.stop();
    } catch (e) {
      print('Error stopping NFC session: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NFC Reader'),
      ),
      body: Center(
        child: Text(
          _tagData.isEmpty ? 'Tap an NFC tag' : _tagData,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
