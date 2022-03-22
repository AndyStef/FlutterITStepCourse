import 'package:flutter/material.dart';
import 'package:login_screen_demo/StyledTextField.dart';

class LoginPageDemo extends StatelessWidget {
  const LoginPageDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // State variables
  var email = '';
  var password = '';
  var isLoginCredentialsValid = false;
  var loginValidator = LoginFormValidator();

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
            buildLoginText(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: StyledTextField(
                title: 'Enter Email',
                icon: Icons.email,
                onTextChange: (text) {
                  print('Email: $text');
                  setState(() {
                    email = text;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: StyledTextField(
                title: 'Enter Password',
                icon: Icons.lock,
                isSecure: true,
                onTextChange: (text) {
                  print('Password: $text');
                  setState(() {
                    password = text;
                  });
                },
              ),
            ),
            _buildLoginButton(),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Or login with...',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white54),
              ),
            ),
            Row(
              children: [
                Expanded(child: buildSocialLoginButton()),
                const SizedBox(width: 16),
                Expanded(child: buildSocialLoginButton()),
                const SizedBox(width: 16),
                Expanded(child: buildSocialLoginButton()),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                isLoginCredentialsValid ? 'Welcome home' : 'You shall not pass',
                textAlign: TextAlign.center,
                style: TextStyle(color: isLoginCredentialsValid ? Colors.green : Colors.redAccent),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildSocialLoginButton() {
    return Container(
      decoration: BoxDecoration(
        //color: Colors.blue,
        border: Border.all(color: Colors.white54),
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      height: 60.0,
    );
  }

  Text buildLoginText() {
    return const Text(
      'Login',
      style: TextStyle(
        fontSize: 34.0,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  ElevatedButton _buildLoginButton() {
    var noDataProvided = (email.isEmpty || password.isEmpty);
    return ElevatedButton(
      onPressed: noDataProvided
          ? null
          : () {
              setState(() {
                isLoginCredentialsValid = loginValidator.validate(email: email, password: password);
              });
            },
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
    );
  }

  // bool _validateInput() {
  //   bool isEmailValid =
  //       RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
  //           .hasMatch(email);
  //   bool isPasswordValid = password.length >= 6;
  //   return isEmailValid && isPasswordValid;
  // }
}

class LoginFormValidator {
  bool validate({required String email, required String password}) {
    bool isEmailValid =
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email);
    bool isPasswordValid = password.length >= 6;
    return isEmailValid && isPasswordValid;
  }
}
