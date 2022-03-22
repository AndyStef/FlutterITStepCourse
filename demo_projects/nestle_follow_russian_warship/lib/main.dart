import 'package:flutter/material.dart';
import 'Screens/IntroScreen.dart';

void main() {
  runApp(const FuckNestleApp());
}

class FuckNestleApp extends StatelessWidget {
  const FuckNestleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData();
    return MaterialApp(
      // theme object that can set default styling for all elements in app
      theme: themeData.copyWith(
        scaffoldBackgroundColor: Colors.yellow,
        appBarTheme: themeData.appBarTheme.copyWith(
          backgroundColor: Colors.blue,
          titleTextStyle: const TextStyle(
            color: Colors.yellowAccent,
            fontSize: 20.0,
          ),
        ),
      ),
      home: IntroScreen(),
    );
  }
}
