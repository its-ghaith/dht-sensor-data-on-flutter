import 'package:flutter/material.dart';
import 'package:mobile_app/_partional/_bottomTable.dart';
import 'package:mobile_app/_partional/_topTable.dart';
import 'constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
        body: Padding(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: [
              TopTable(),
              Divider(color: primaryColor,thickness: 2,height: 50,),
              BottomTable()
            ],
          )
        ));
  }
}





