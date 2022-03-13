import 'package:flutter/material.dart';

void main() {
  runApp(const LoginPageDemo());
}

class LoginPageDemo extends StatelessWidget {
  const LoginPageDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 300.0,
            ),
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 34.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.alternate_email,
                    color: Colors.black45,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white54,
                      width: 10.0,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white54,
                      width: 1.0,
                    ),
                  ),
                  labelText: 'Enter Email',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black45,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white54,
                        width: 10.0,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white54,
                        width: 1.0,
                      ),
                    ),
                    labelText: 'Enter Password',
                    labelStyle: TextStyle(color: Colors.white)),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                minimumSize: const Size(150, 50),
                shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
              child: const Text('Login'),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Or, login with...',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white54),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      //color: Colors.blue,
                      border: Border.all(color: Colors.white54),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    height: 60.0,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      //color: Colors.blue,
                      border: Border.all(color: Colors.white54),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    height: 60.0,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      //color: Colors.blue,
                      border: Border.all(color: Colors.white54),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    height: 60.0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
