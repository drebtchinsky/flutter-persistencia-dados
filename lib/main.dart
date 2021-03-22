import 'package:flutter/material.dart';

void main() {
  runApp(Bytebank2App());
}

class Bytebank2App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('dashboard'),
        ),
      ),
    );
  }
}
