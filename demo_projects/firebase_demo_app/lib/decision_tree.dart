import 'package:firebase_demo_app/home_page.dart';
import 'package:firebase_demo_app/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DecisionTree extends StatefulWidget {
  @override
  _DecisionTreeState createState() => _DecisionTreeState();
}

class _DecisionTreeState extends State<DecisionTree> {
  User? user;

  @override
  void initState() {
    super.initState();
    setState(() {
      user = FirebaseAuth.instance.currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return LoginPage(
        onSignInAnonymously: (user) {
          setState(() {
            this.user = user;
          });
        },
        onSignInWithEmail: (user) {
          setState(() {
            this.user = user;
          });
        },
      );
    }

    return HomePage(
      onSignOut: () {
        setState(() {
          user = null;
        });
      },
    );
  }
}
