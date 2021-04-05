import 'package:bluetooth_scanner/components/list_item_device_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';


class CustomListView extends StatefulWidget {

  final List<ScanResult> listScanResult;

  CustomListView({ @required this.listScanResult});

  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.listScanResult.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListItemDeviceWidget(bluetoothDevice: widget.listScanResult[index].device);
        });
  }
}
