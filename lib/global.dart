import 'package:flutter/material.dart';

showSnackBar({required String message, required Color color, required int duration, required context,}){
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: duration),
      backgroundColor: Colors.white,
      content: Text(
        message,
        style: TextStyle(color: color, fontSize: 20),
      ),
      action: SnackBarAction(
          label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}

