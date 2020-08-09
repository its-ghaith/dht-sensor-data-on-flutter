import 'package:flutter/material.dart';
import 'package:mobile_app/Home.dart';
import 'package:mobile_app/constants.dart';
import 'package:provider/provider.dart';

class OnOffLedIconButton extends StatefulWidget {
  String iconPath;
  _OnOffLedIconButtonState o;

  OnOffLedIconButton(iconPath) {
    this.iconPath = iconPath;
    this.o = new _OnOffLedIconButtonState(this.iconPath);
  }

  @override
  _OnOffLedIconButtonState createState() => this.o;
}

class _OnOffLedIconButtonState extends State<OnOffLedIconButton> {
  String iconPath;
  dynamic switchled;

  _OnOffLedIconButtonState(this.iconPath);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: primaryColor,
      child: IconButton(
        icon: new Image.asset(iconPath),
        iconSize: 10,
        onPressed: (){
        },
      )
    );
  }
}
