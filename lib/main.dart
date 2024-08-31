import 'package:flutter/material.dart';
import 'package:product_application/presentation/screens/home_screen.dart';
import 'package:product_application/presentation/screens/signin_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}