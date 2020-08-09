import 'package:flutter/material.dart';
import 'package:mobile_app/_partional/wemos.dart';
import 'constants.dart';
import 'package:random_string/random_string.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String clientIdWemos1;
  String clientIdWemos2;
  @override
  Widget build(BuildContext context) {
    clientIdWemos1=randomString(20);
    clientIdWemos2=randomString(20);
    return Scaffold(
        appBar: AppBar(
          title: Text('Display Sensor'),
          backgroundColor: primaryColor,
          elevation: 6,
          leading: IconButton(
              icon: new Image.asset('assets/icons/icons8-iot-sensor-100.png'),
              onPressed: null),
          titleSpacing: 5,
        ),
        body: Center(
          child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height * .02),
              child: ListView(
                children: [
                  Wemos("1",clientIdWemos1),
                  Divider(color: primaryColor, height: 50, thickness: 2),
                  Wemos("2",clientIdWemos2)
                ],
              )),
        ));
  }

}
