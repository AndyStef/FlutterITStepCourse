import 'package:flutter/material.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({Key? key}) : super(key: key);

  // Container
  // Center
  // Align
  // Row
  // Column

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LayoutTest1(),
    );
  }

  // Combining base widgets
  Widget baseExample() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('It\'s me right here'),
        leading: const Icon(Icons.mail),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.lock),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal,
        child: const Icon(Icons.wifi),
      ),
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.yellow,
            //width: 100,
            height: 100,
            child: const Center(child: Text('test')),
          ),
          Container(
            color: Colors.green,
            height: 100.0,
          ),
        ],
      ),
    );
  }

  // Inserting one complete layout into other container
  Widget someRandomExample() {
    return Column(
      children: [
        Expanded(child: LayoutTest1()),
        Expanded(
          child: Container(
            color: Colors.greenAccent,
            child: const Center(
              child: Text('Hello there'),
            ),
          ),
        )
      ],
    );
  }

  // Grid like layout
  Widget rowExample() {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.yellow,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  // Columns + Expaneded + Align
  Widget anotherExample() {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(child: Container(color: Colors.yellow)),
              Expanded(
                child: Container(
                  color: Colors.green,
                  child: const Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'Hello there',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(child: Container(color: Colors.greenAccent)),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(flex: 4, child: Container(color: Colors.greenAccent)),
              //Expanded(child: Container(color: Colors.blueAccent)),
              Expanded(child: Container(color: Colors.black38)),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(child: Container(color: Colors.pink)),
              Expanded(child: Container(color: Colors.green)),
              Expanded(child: Container(color: Colors.pinkAccent)),
            ],
          ),
        )
      ],
    );
  }
}

// Showing of different widgets combined
class MyTestWidget extends StatelessWidget {
  const MyTestWidget({Key? key}) : super(key: key);

  // Container
  // Center
  // Align
  // Row
  // Column

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.yellow,
              height: 100,
              width: 200,
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.pink,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.blue,
                child: Center(child: Text('Try me out!')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Implementation of test task (advanced)
class LayoutTest1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.teal,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.5,
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1.0,
                          child: Container(
                            color: Colors.yellow,
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 1.0,
                          child: Container(
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}

// Implementation of test task (more simple)
class LayoutTest0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.pinkAccent,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.teal,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.yellow,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    color: Colors.green,
                    height: 100,
                    width: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
