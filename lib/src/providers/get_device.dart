import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

class GetDevice extends StatefulWidget {

  @override
  GetDeviceState createState() => GetDeviceState();
}

class GetDeviceState extends State<GetDevice> {

  
 String info;
  @override
  Widget build(BuildContext context) {
    return Container(
   
    );
  }



Future<String> getDevice() async{


  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

var brand = androidInfo.id;

setState(() {
  info = brand;
});

return info;
}

}