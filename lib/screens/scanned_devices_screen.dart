import 'package:bluetooth_scanner/components/custom_list_view.dart';
import 'package:bluetooth_scanner/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';



class ScannedDevicesScreen extends StatefulWidget {
  @override
  _ScannedDevicesScreenState createState() => _ScannedDevicesScreenState();
}

class _ScannedDevicesScreenState extends State<ScannedDevicesScreen> {

  bool scanning = true;
  FlutterBlue flutterBlue = FlutterBlue.instance;

  @override
  void initState() {
    super.initState();
    _scan();
  }

  _scan() {
      flutterBlue.startScan(timeout: Duration(seconds: 4));
      flutterBlue.isScanning.listen((result) {
        print('is scanning: ' + result.toString());
        setState(() {
          scanning = result;
        });
      });
      flutterBlue.stopScan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      appBar: AppBar(
        backgroundColor: primary_color,
        title: Text(
          'Bluetooth Scanner', style: TextStyle(color: Colors.white)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Devices found', style: TextStyle(color: primary_color, fontWeight: FontWeight.bold, fontSize: 22),),
            SizedBox(height: 20),
            scanning ? CircularProgressIndicator() : Container(),
            StreamBuilder<List<ScanResult>>(
              stream: FlutterBlue.instance.scanResults,
              initialData: [],
              builder: (c, snapshot) {
                return CustomListView(listScanResult: snapshot.data);
              },
            ),
          ]
        ),
      ),
    );
  }
}
