import 'package:flutter/material.dart';

import '../constants.dart';

class Display extends StatelessWidget {
  String iconPath;
  String text;

  Display(this.iconPath, this.text);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      color: primaryColor,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.23,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(iconPath),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight:FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
