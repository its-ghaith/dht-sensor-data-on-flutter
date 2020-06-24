import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sensor Display',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Display Sensor'),
          backgroundColor: Color.fromRGBO(111, 255, 194, 1),
          elevation: 6,
          leading: IconButton(
              icon: new Image.asset('assets/icons/icons8-iot-sensor-100.png'),
              onPressed: null),
          titleSpacing: 5,
        ),
      ),
    );
  }
}
