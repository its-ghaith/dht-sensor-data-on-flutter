import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/_partional/functions/mqtt_connection.dart' as mq;

class DisconnectIconButton extends StatefulWidget {
  @override
  _DisconnectIconButtonState createState() => _DisconnectIconButtonState();
}

class _DisconnectIconButtonState extends State<DisconnectIconButton> {
  static final String iconPath="assets/icons/icons8-getrennt-64.png";
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.symmetric(horizontal: 0),
      icon: new Image.asset(iconPath),
      onPressed: () => {
      },
    );
  }
}
