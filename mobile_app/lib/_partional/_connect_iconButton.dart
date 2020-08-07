import 'package:flutter/material.dart';
import 'package:mobile_app/_partional/functions/mqtt_connection.dart' as mq;

class ConnectIconButton extends StatelessWidget {
  static final iconPath = "assets/icons/icons8-computer-verbinden-100.png";
  TextEditingController controller;

  ConnectIconButton({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.symmetric(horizontal: 0),
      icon: new Image.asset(iconPath),
      onPressed: () => {
        if (controller != null &&
            controller.text.isNotEmpty &&
            controller.text.trim().isNotEmpty)
          {
            mq.connectToSubscribe(topic: controller.text),
          },
      },
    );
  }
}
