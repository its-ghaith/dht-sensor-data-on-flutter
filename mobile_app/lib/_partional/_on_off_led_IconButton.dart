import 'package:flutter/material.dart';
import 'package:mobile_app/constants.dart';

class OnOffLedIconButton extends StatefulWidget {
  String iconPath;

  OnOffLedIconButton(this.iconPath);

  @override
  _OnOffLedIconButtonState createState() =>
      _OnOffLedIconButtonState(this.iconPath);
}

class _OnOffLedIconButtonState extends State<OnOffLedIconButton> {
  String iconPath;

  _OnOffLedIconButtonState(this.iconPath);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: primaryColor,
      child: Center(
        child: IconButton(
          icon: new Image.asset(iconPath),
          iconSize: 50,
          onPressed: () => {},
        ),
      ),
    );
  }
}
