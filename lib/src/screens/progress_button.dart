import 'package:flutter/material.dart';
import 'dart:async';

class ProgressButton extends StatefulWidget {
  @override
  _ProgressButtonState createState() => _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton>
    with TickerProviderStateMixin {
  bool _isPressed = false;
  int state = 0;
  double width = double.infinity;
  Animation _animation;
  GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Progress Button'),
        centerTitle: true,
      ),
      body: new Container(
        color: Colors.white,
        alignment: Alignment.center,
        padding: new EdgeInsets.symmetric(horizontal: 30.0),
        child: new PhysicalModel(
          color: Colors.blue,
          elevation: _isPressed ? 6.0 : 4.0,
          borderRadius: new BorderRadius.circular(25.0),
          child: new Container(
            key: globalKey,
            height: 48.0,
            width: width,
            child: new RaisedButton(
              padding: new EdgeInsets.all(0.0),
              color: state == 2 ? Colors.green : Colors.blue,
              onPressed: () {},
              onHighlightChanged: (isPressed) {
                setState(() {
                  _isPressed = isPressed;
                  if (state == 0) {
                    animateButton();
                  }
                });
              },
              child: buildButtonChild(),
            ),
          ),
        ),
      ),
    );
  }

  void animateButton() {
    double initialWidth = globalKey.currentContext.size.width;
    var controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          width = initialWidth - ((initialWidth - 48.0) * _animation.value);
        });
      });
    controller.forward();

    setState(() {
      state = 1;
    });
    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        state = 2;
      });
    });
  }

  Widget buildButtonChild() {
    if (state == 0) {
      return new Text(
        'Login',
        style: new TextStyle(color: Colors.white),
      );
    } else if (state == 1) {
      return new SizedBox(
          height: 36.0,
          width: 36.0,
          child: new CircularProgressIndicator(
              value: null,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }
}
