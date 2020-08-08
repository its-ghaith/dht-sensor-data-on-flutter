import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;

  CustomTextField(this.hint);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState(this.hint);
}

class _CustomTextFieldState extends State<CustomTextField> {
  String hint;
  _CustomTextFieldState(this.hint);

  @override
  Widget build(BuildContext context) {
    return Container(width: MediaQuery.of(context).size.width*.5,
      height: 40,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          hintText: this.hint,
        ),
      ),);
  }
}