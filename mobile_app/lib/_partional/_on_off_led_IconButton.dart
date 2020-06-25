import 'package:flutter/material.dart';
import 'package:mobile_app/constants.dart';
class OnOffLedIconButton extends StatelessWidget {
  const OnOffLedIconButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 10),
      width: 60,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: primaryColor,
        child: Center(
          child: IconButton(
            icon: new Image.asset('assets/icons/icons8-led-diode-100.png'),
            iconSize: 50,
            onPressed: () => {},
          ),
        ),
      ),
    );
  }
}