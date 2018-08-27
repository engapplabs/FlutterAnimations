import 'package:flutter/material.dart';
import 'show_items.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Animations'),
          centerTitle: true,
        ),
        body: new Container(
          margin: new EdgeInsets.all(16.0),
          child: AnimationsList(),
        ),
      ),
    );
  }
}
