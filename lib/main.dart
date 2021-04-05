import 'package:bluetooth_scanner/screens/scanned_devices_screen.dart';
import 'package:bluetooth_scanner/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bluetooth Scanner',
      theme: ThemeData(
        backgroundColor: background_color,
        primaryColor: Colors.white,
      ),
      home: ScannedDevicesScreen()
    );
  }
}
