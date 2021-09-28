import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(color: Colors.orange,width: 150,height: 150,),
          Positioned(
              top: 60,
              left: 60,
              child: Container(color: Colors.yellow,width: 150,height: 150,)),
          Positioned(
              top: 150,
              left: 170,
              child: Container(color: Colors.red,width: 150,height: 150,)),
          Positioned(
              right: 60,
              top: 60,
              child: Container(color: Colors.blueAccent,width: 150,height: 150,)),
          Positioned(
              right: 0,
              child: Container(color: Colors.grey,width: 150,height: 150,)),
        ],
      ),
    );
  }
}
