import 'package:flutter/material.dart';
import 'constants.dart';
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
          backgroundColor: primaryColor,
          elevation: 6,
          leading: IconButton(
              icon: new Image.asset('assets/icons/icons8-iot-sensor-100.png'),
              onPressed: null),
          titleSpacing: 5,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 200,
              margin: EdgeInsets.only(
                  top: 33,
                  bottom: 33
              ),
              child: Center(

              ),
            ),
            Divider(
              color: primaryColor,
              endIndent: 50,
              indent: 50,
              thickness: 2,
            ),
            Container(

            ),
          ],
        ),
      ),
    );
  }
}
