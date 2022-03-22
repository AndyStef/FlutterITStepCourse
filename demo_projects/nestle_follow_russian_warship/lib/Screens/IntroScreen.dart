import 'package:flutter/material.dart';
import 'CategoriesListScreen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/FuckNestle.jpeg'),
          Image.asset('images/RussianWarship.jpeg'),
          const SizedBox(
            height: 32.0,
          ),
          ElevatedButton(
            onPressed: () {
              // this method is useful when you don't want to return to this screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoriesListScreen(),
                ),
              );
            },
            child: const Text(
              'Слава Україні 🇺🇦',
              style: TextStyle(fontSize: 34.0),
            ),
          )
        ],
      ),
    );
  }
}
