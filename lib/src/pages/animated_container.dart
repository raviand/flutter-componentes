import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  AnimatedContainerPage({Key key}) : super(key: key);

  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOutQuint,
          width: _width,
          height: _height,
          decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _cambiarValores,
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  void _cambiarValores() {
    final random = Random();

    setState(() {
      _height = random.nextInt(300).toDouble();
      _width = random.nextInt(300).toDouble();
      _color =  Color.fromRGBO(
        random.nextInt(255), 
        random.nextInt(255), 
        random.nextInt(255), 
        1);
      _borderRadius = BorderRadius.circular( random.nextInt(150).toDouble());
    });
  }
}
