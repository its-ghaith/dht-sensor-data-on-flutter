import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  var _textController = TextEditingController();

  CustomTextField({@required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*.5,
      height: 40,
      child: TextField(
        controller: _textController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          hintText: this.hint,
        ),
      ),
    );
  }

  get textController => _textController;
}
