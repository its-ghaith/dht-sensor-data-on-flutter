import 'package:flutter/material.dart';
import 'package:mobile_app/text_Connect_Disconnect.dart';
import 'package:mobile_app/_partional/_on_off_led_IconButton.dart';

class WemosForm extends StatefulWidget {
  _WemosFormState w;
  String iconPath;

  WemosForm(String iconPath,String hintSub,String hintPub) {
    this.iconPath = iconPath;
    this.w=new _WemosFormState(iconPath,hintSub,hintPub);
  }

  @override
  _WemosFormState createState() =>this.w;
}

class _WemosFormState extends State<WemosForm> {
  TextConnectDisconnect sub;
  TextConnectDisconnect pub;
  OnOffLedIconButton onOffLedIconButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 0,
            child: Container(
              child: Column(
                children: [
                  sub,
                  pub
                ],
              ),
            )
        ),
        Expanded(
          flex: 0,
            child: Container(
              child: Column(
                children: [
                  onOffLedIconButton
                ],
              ),
            )
        )
      ],
    );
  }

  _WemosFormState(String iconPath, String hintSub, String hintPub) {
    sub=TextConnectDisconnect(hintSub);
    pub=TextConnectDisconnect(hintPub);
    onOffLedIconButton = new OnOffLedIconButton(iconPath);
  }

}
