import 'dart:io';
import 'package:flutter/material.dart';

main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Network Interface example",
      home: new NetworkInterfaceWidget(),
    );
  }
}

class NetworkInterfaceWidget extends StatefulWidget {
  @override
  _NetworkInterfaceState createState() => new _NetworkInterfaceState();
}

class _NetworkInterfaceState extends State<NetworkInterfaceWidget> {
  String _networkInterface;
  @override
  initState() {
    super.initState();

    NetworkInterface.list(includeLoopback: false, type: InternetAddressType.any)
    .then((List<NetworkInterface> interfaces) {
      setState( () {
        _networkInterface = "";
        interfaces.forEach((interface) {
          _networkInterface += "### name: ${interface.name}\n";
          int i = 0;
          interface.addresses.forEach((address) {
            _networkInterface += "${i++}) ${address.address}\n";
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        title: Text("NetworkInterface"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Text("Only in iOS.. :(\n\nNetworkInterface:\n $_networkInterface"),
      ),
    );
  }
}