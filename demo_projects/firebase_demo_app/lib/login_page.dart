import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function(User) onSignInAnonymously;
  final Function(User) onSignInWithEmail;

  const LoginPage({
    Key? key,
    required this.onSignInAnonymously,
    required this.onSignInWithEmail,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String? error;

  Future<void> _signInAnonymously() async {
    UserCredential credentials = await FirebaseAuth.instance.signInAnonymously();
    print(credentials.user);
    widget.onSignInAnonymously(credentials.user!);
  }

  Future<void> _signInWithEmailAndPassword() async {
    try {
      UserCredential credentials = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print(credentials.user);
      widget.onSignInWithEmail(credentials.user!);
    } on FirebaseAuthException catch (e) {
      setState(() {
        error = e.message;
      });
    }
  }

  Future<void> _createAccountWithEmailAndPassword() async {
    try {
      UserCredential credentials = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print(credentials.user);
      widget.onSignInWithEmail(credentials.user!);
    } on FirebaseAuthException catch (e) {
      setState(() {
        error = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: 'Enter your email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Enter your password'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _createAccountWithEmailAndPassword,
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  minimumSize: const Size.fromHeight(50.0),
                ),
                child: Text('Create account'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _signInWithEmailAndPassword,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50.0),
                ),
                child: Text('Sign in with email'),
              ),
            ),
            if (error != null)
              Text(
                error!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24.0,
                  color: Colors.red,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _signInAnonymously,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  minimumSize: const Size.fromHeight(50.0),
                ),
                child: Text('Sign in anonymously'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
