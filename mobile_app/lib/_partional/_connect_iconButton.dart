import 'package:flutter/material.dart';
import 'package:mobile_app/_partional/functions/mqtt_connection.dart' as mq;

class ConnectIconButton extends StatefulWidget {
  @override
  _ConnectIconButtonState createState() => _ConnectIconButtonState();
}

class _ConnectIconButtonState extends State<ConnectIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.symmetric(horizontal: 0),
      icon: new Image.asset("assets/icons/icons8-computer-verbinden-100.png"),
      onPressed: () => {
      },
    );
  }
}
