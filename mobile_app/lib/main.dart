import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Home.dart';
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
      home: new Home(),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Color color;

  CustomTextField({@required this.hint, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return Container(
        height: 50,
        width: 200,
        margin: EdgeInsets.only(top: 5),
        child: TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              hintText: this.hint,
              prefixIcon: Icon(
                icon,
                color: color,
              )),
        ),
      );
    } else {
      return Container(
        height: 50,
        width: 200,
        margin: EdgeInsets.only(top: 5),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            hintText: this.hint,
          ),
        ),
      );
    }
  }
}
