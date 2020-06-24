import 'package:flutter/material.dart';
import 'package:mobile_app/constants.dart';

class BottomTable extends StatefulWidget {
  @override
  _BottomTableState createState() => _BottomTableState();
}

class _BottomTableState extends State<BottomTable> {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomViewCard(iconPath: 'assets/icons/icons8-thermometer-64.png')
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomViewCard(iconPath: 'assets/icons/icons8-feuchtigkeitsmesser-64.png',)
                ],
              ),
            ]
        ),
        TableRow(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomViewCard(iconPath: 'assets/icons/icons8-thermometer-64.png')
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomViewCard(iconPath: 'assets/icons/icons8-feuchtigkeitsmesser-64.png',)
                ],
              ),
            ]
        )

      ],
    );
  }
}

class CustomViewCard extends StatelessWidget {
  final String iconPath;

  CustomViewCard({@required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 170,
      child: Card(
        color: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child:IconButton(
          icon: new Image.asset(iconPath),
          iconSize: 50,
          onPressed: ()=>{},
        ),
      ),
    );
  }
}