import 'package:flutter/material.dart';
import 'package:mobile_app/_partional/_custom_text_field.dart';
import 'package:mobile_app/_partional/_connect_iconButton.dart';
import 'package:mobile_app/_partional/_disconnect_iconButton.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class TextConnectDisconnect extends StatefulWidget {
  final String hint;
  _TextConnectDisconnectState t;

  TextConnectDisconnect(this.hint){
    this.t=_TextConnectDisconnectState(this.hint);
  }

  @override
  _TextConnectDisconnectState createState() =>
     this.t;
}

class _TextConnectDisconnectState extends State<TextConnectDisconnect> {
  CustomTextField textField;
  ConnectIconButton connectIconButton;
  DisconnectIconButton disconnectIconButton;
  MqttServerClient client;

  _TextConnectDisconnectState(String hint) {
    textField = new CustomTextField(hint: hint);
    connectIconButton =
        new ConnectIconButton(controller: textField.textController);
    disconnectIconButton = new DisconnectIconButton();
    String broker = 'broker.mqttdashboard.com';
    String clientIdentifier = 'clientId-Z5Q0iVymbd';
    client = MqttServerClient(broker, clientIdentifier);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex:0,child: textField),
        Expanded(flex:0,child: connectIconButton),
        Expanded(flex:0,child: disconnectIconButton),
      ],
    );
  }
}
