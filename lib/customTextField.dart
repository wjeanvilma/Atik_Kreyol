import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {

  final bool obscureText;
  final TextEditingController field;
  final String hint;
  final IconData icon;
  CustomTextField({required this.field, required this.obscureText, required this.hint, required this.icon});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: TextField(
        obscureText: widget.obscureText,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          focusColor: Colors.grey,
          border: InputBorder.none,
          hintText: widget.hint,
          // labelText: 'Email',
          prefixIcon: Icon(widget.icon, color: Colors.blueGrey),
        ),
        onChanged: (value) {
           widget.field.text = value;
        },
      ),
    );
  }
}
