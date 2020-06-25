import 'package:flutter/material.dart';
import 'package:mobile_app/_partional/functions/mqtt_connection.dart' as mq;

class ConnectIconButton extends StatelessWidget {
  final TextEditingController controller;
  final bool isSubscribe;
  static final String iconPath =
      "assets/icons/icons8-computer-verbinden-100.png";
  bool _isButtonDisabled = false;

  ConnectIconButton({
    this.controller,
    @required this.isSubscribe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 5),
        child: Visibility(
          child: IconButton(
            padding: EdgeInsets.all(0),
            icon: new Image.asset(iconPath),
            onPressed: () => _isButtonDisabled
                ? null
                : {
                    if (controller != null &&
                        controller.text.isNotEmpty &&
                        controller.text.trim().isNotEmpty)
                      {
                        if (isSubscribe)
                          {
                            mq.connectToSubscribe(topic: controller.text),
                          }
                        else
                          {mq.connectToPublish(topic: controller.text)}
                      },
                  },
          ),
        ));
  }
}
