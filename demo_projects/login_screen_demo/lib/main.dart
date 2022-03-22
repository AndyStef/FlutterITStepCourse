import 'package:flutter/material.dart';
import 'package:login_screen_demo/LoginPageDemo.dart';

void main() {
  runApp(DemoApp());
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPageDemo(),
    );
  }
}
