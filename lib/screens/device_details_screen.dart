import 'package:bluetooth_scanner/components/custom_list_view.dart';
import 'package:bluetooth_scanner/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class DeviceDetailScreen extends StatefulWidget {

  final BluetoothDevice bluetoothDevice;

  DeviceDetailScreen({ @required this.bluetoothDevice});

  @override
  _DeviceDetailScreenState createState() => _DeviceDetailScreenState();
}

class _DeviceDetailScreenState extends State<DeviceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      appBar: AppBar(
        backgroundColor: primary_color,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          'Device Details', style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 15),
          child: Card(
            color: primary_color,
            child:
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            'Name:',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: secundary_color
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                           widget.bluetoothDevice.name?.isEmpty ?? true ? 'Unknow': widget.bluetoothDevice.name,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: secundary_color
                            ),
                          ),
                        ]
                      ),
                    ),
                    Expanded(
                      child: Row(
                            children: [
                              Text(
                                'Id:',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: secundary_color
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                widget.bluetoothDevice.id.toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: secundary_color
                                ),
                              )
                            ],
                          ),
                    )
                      ],
                  ),
                ),
              )
          ),
        ),
    );
  }
}
