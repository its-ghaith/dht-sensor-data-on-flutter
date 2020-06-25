import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Color color;
  var _textController= TextEditingController();
  CustomTextField({@required this.hint, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return Container(
        height: 50,
        width: 200,
        margin: EdgeInsets.only(top: 5),
        child: TextField(
          controller: _textController,
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
          controller: _textController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            hintText: this.hint,
          ),
        ),
      );
    }
  }

  get textController => _textController;
}
