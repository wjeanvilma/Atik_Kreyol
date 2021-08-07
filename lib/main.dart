import 'package:flutter/material.dart';
import 'home.dart';
import 'package:get/get.dart';

// È Ò è ò
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
        home: Home(),
    );
  }
}

