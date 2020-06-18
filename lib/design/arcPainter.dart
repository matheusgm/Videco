import 'package:flutter/material.dart';
import 'dart:math';

class MyArc extends StatelessWidget {
  final double diameter;
  final double angle;
  final Color color;

  const MyArc({Key key, this.diameter = 200, this.angle, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter:
          MyPainter(this.angle, this.color, MediaQuery.of(context).size.width),
      size: Size(diameter, diameter),
    );
  }
}

// This is the Painter class
class MyPainter extends CustomPainter {
  final double angle;
  final Color color;
  final double dx;
  MyPainter(this.angle, this.color, this.dx);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = this.color;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(dx, 0),
        height: size.height,
        width: size.width,
      ),
      pi / 2,
      pi / 2,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
