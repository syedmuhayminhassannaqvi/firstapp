import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  List<String> tasksList = [
    'Task 1',
    'Task 2',
    'Task 3',
    'Task 4',
    'Task 5',
    'Task 6',
    'Task 7',
  ];



  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children:
          tasksList.map((e) => Text(e)).toList(),


      ),
    );
  }
}
