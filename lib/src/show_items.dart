import 'package:flutter/material.dart';
import 'screens/progress_button.dart';
import 'screens/hero_and_collapse/hero_&_collapse.dart';

class AnimationsList extends StatefulWidget {
  @override
  _AnimationsListState createState() => _AnimationsListState();
}

void _navProgressButton(BuildContext context) {
  Navigator.push(context,
      new MaterialPageRoute(builder: (context) => new ProgressButton()));
}

void _navHeroAndCollapse(BuildContext context) {
  Navigator.push(context,
      new MaterialPageRoute(builder: (context) => new HeroAndCollapse()));
}

class _AnimationsListState extends State<AnimationsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => _navProgressButton(context),
                child: new Text('Progress Button'),
              ),
              new RaisedButton(
                onPressed: () => _navHeroAndCollapse(context),
                child: new Text('Hero & Collapse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
