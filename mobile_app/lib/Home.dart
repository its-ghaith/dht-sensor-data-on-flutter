import 'package:flutter/material.dart';
import 'package:mobile_app/_partional/_display.dart';
import 'package:mobile_app/wemos_display.dart';
import 'constants.dart';
import 'package:mobile_app/wemos_form.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    WemosForm w1 = new WemosForm("assets/icons/icons8-led-diode-100.png",
        "sub. topic wemos 1", "pub. topic wemos 1");
    WemosForm w2 = new WemosForm("assets/icons/icons8-led-diode-100.png",
        "sub. topic wemos 2", "pub. topic wemos 2");
    WemosDisplay wd1= WemosDisplay(
        'assets/icons/icons8-thermometer-64.png',
        'assets/icons/icons8-feuchtigkeitsmesser-64.png',
        'temperature: 30',
        'humidity: 40'
    );
    WemosDisplay wd2= WemosDisplay(
        'assets/icons/icons8-thermometer-64.png',
        'assets/icons/icons8-feuchtigkeitsmesser-64.png',
        'temperature: 30',
        'humidity: 40'
    );
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
              padding: EdgeInsets.all(MediaQuery.of(context).size.height*.02),
              child: ListView(
                children: [
                  w1,
                  w2,
                  Divider(
                    color: primaryColor,
                    height: MediaQuery.of(context).size.height*.05,
                    thickness: 2,
                  ),
                  wd1,
                  wd2
                ],
              )),
        ));
  }
}
