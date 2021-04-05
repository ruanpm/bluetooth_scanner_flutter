import 'package:bluetooth_scanner/screens/device_details_screen.dart';
import 'package:bluetooth_scanner/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class ListItemDeviceWidget extends StatefulWidget {

  final BluetoothDevice bluetoothDevice;

  ListItemDeviceWidget({ @required this.bluetoothDevice});

  @override
  _ListItemDeviceWidgetState createState() => _ListItemDeviceWidgetState();
}

class _ListItemDeviceWidgetState extends State<ListItemDeviceWidget> {


  _goToDeviceDetailedWidget() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          //bluetoothDevice.connect();
          return DeviceDetailScreen(bluetoothDevice: widget.bluetoothDevice);
        } ,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Card(
        color: secundary_color,
        child:
        ListTile(
          onTap: () {
            _goToDeviceDetailedWidget();
          },
          //contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          leading: Container(
            width: 30,
            child:
              Icon(
                Icons.phone_android,
                color: primary_color
              ),
          ),
          title:
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            decoration: BoxDecoration(
              color: primary_color,
              borderRadius: BorderRadius.circular(5),
            ),
            child:
              Text(
                  widget.bluetoothDevice.name?.isEmpty ?? true ? 'Unknow': widget.bluetoothDevice.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: secundary_color
                  ),
              ),
          )
        ),
      ),
    );
  }
}
