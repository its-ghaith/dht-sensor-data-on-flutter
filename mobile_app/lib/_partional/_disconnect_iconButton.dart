import 'package:flutter/material.dart';
import 'package:mobile_app/_partional/functions/mqtt_connection.dart' as mq;

class DisconnectIconButton extends StatelessWidget {
  final TextEditingController controller;
  final bool type;
  static final String iconPath="assets/icons/icons8-getrennt-64.png";

  DisconnectIconButton(
      {this.controller, @required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: IconButton(
        padding: EdgeInsets.all(0),
        icon: new Image.asset(iconPath),
        onPressed: () => {
          if (controller != null &&
              controller.text.isNotEmpty &&
              controller.text.trim().isNotEmpty)
            {

            }
        },
      ),
    );
  }
}
