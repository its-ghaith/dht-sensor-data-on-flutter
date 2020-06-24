import 'package:flutter/material.dart';
import 'package:mobile_app/constants.dart';

class TopTable extends StatefulWidget {
  @override
  _TopTableState createState() => _TopTableState();
}

class _TopTableState extends State<TopTable> {
  @override
  Widget build(BuildContext context) {
    return Table(children: [
      TableRow(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(hint: "sub. Topic Wemos 1"),
              CustomTextField(hint: "pub. Topic Wemos 1"),
              CustomTextField(hint: "sub. Topic Wemos 2"),
              CustomTextField(hint: "pub. Topic Wemos 2"),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConnectIconButton(),
                      ConnectIconButton(),
                      ConnectIconButton(),
                      ConnectIconButton(),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OnOffLebIconButton(),
                        OnOffLebIconButton(),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      )
    ]);
  }
}

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Color color;

  CustomTextField({@required this.hint, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return Container(
        height: 50,
        width: 200,
        margin: EdgeInsets.only(top: 5),
        child: TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              hintText: this.hint,
              prefixIcon: Icon(
                icon,
                color: color,
              )),
        ),
      );
    } else {
      return Container(
        height: 50,
        width: 200,
        margin: EdgeInsets.only(top: 5),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            hintText: this.hint,
          ),
        ),
      );
    }
  }
}
class ConnectIconButton extends StatelessWidget {
  const ConnectIconButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: IconButton(
          padding: EdgeInsets.all(0),
          icon:
          new Image.asset('assets/icons/icons8-computer-verbinden-100.png'),
          onPressed: null),
    );
  }
}
class OnOffLebIconButton extends StatelessWidget {
  const OnOffLebIconButton({
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
            onPressed: ()=>{},
          ),
        ),
      ),
    );
  }
}