import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(TipsAndTricksApp());
}

class TipsAndTricksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

class GradientExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.yellowAccent,
            Colors.redAccent,
          ],
        ),
      ),
    );
  }
}

class ShowAlertExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Tap me!'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (builder) {
              var okButton = TextButton(
                child: const Text("Dismiss me"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              );

              return AlertDialog(
                title: const Text("Hello there!"),
                actions: [okButton],
              );
            },
          );
        },
      ),
    );
  }
}

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          ListTile(
            title: Text('User settings'),
            leading: Icon(Icons.settings),
          ),
          ListTile(
            title: Text('Leave feedback'),
            leading: Icon(Icons.feedback),
          ),
          ListTile(
            title: Text('About us'),
            leading: Icon(Icons.info),
          ),
        ],
      ),
    );
  }
}
