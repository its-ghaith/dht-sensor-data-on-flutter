import 'package:flutter/material.dart';
import 'package:mobile_app/_partional/_display.dart';
import 'package:mobile_app/text_Connect_Disconnect.dart';
import 'package:mobile_app/_partional/_on_off_led_IconButton.dart';

class WemosDisplay extends StatefulWidget {
  _WemosDisplayState w;
  String iconPathTemp;
  String iconPathHumidity;

  WemosDisplay(String iconPathTemp,String iconPathHumidity , String textTemp, String textHumidity) {
    this.iconPathTemp = iconPathTemp;
    this.iconPathHumidity = iconPathHumidity;
    this.w = new _WemosDisplayState(iconPathTemp,iconPathHumidity, textTemp, textHumidity);
  }

  @override
  _WemosDisplayState createState() => this.w;
}

class _WemosDisplayState extends State<WemosDisplay> {
  Display temp;
  Display humidity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [temp],
              ),
            )),
        Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [humidity],
              ),
            ))
      ],
    );
  }

  _WemosDisplayState(String iconPathTemp, String iconPathHumidity, String textTemp, String textHumidity) {
    temp = Display(iconPathTemp, textTemp);
    humidity = Display(iconPathHumidity, textHumidity);
  }
}
