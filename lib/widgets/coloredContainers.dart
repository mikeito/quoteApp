import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quotes_app/utils/generateGradient.dart';

class ColoredContainers extends StatefulWidget {

  ColoredContainers({Key key, @required this.grad})
    : super(key: key);

  final LinearGradient grad;

  @override
  _ColoredContainersState createState() => _ColoredContainersState();
}

class _ColoredContainersState extends State<ColoredContainers> {

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 45.0),
      child: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(screenSize.width * 0.4, 15),
            child: Transform.rotate(
              angle: -0.3,
              child: Opacity(
                opacity: 0.3,
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  height: screenSize.height * 0.7,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    gradient: widget.grad
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(screenSize.width * 0.4, 20),
            child: Transform.rotate(
              angle: -0.4,
              child: Opacity(
                opacity: 0.5,
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  height: screenSize.height * 0.7,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    gradient: widget.grad,
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(screenSize.width * 0.4, 20),
            child: Transform.rotate(
              angle: -0.5,
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                height: screenSize.height * 0.7,
                width: screenSize.width,
                decoration: BoxDecoration(
                  gradient: widget.grad,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
