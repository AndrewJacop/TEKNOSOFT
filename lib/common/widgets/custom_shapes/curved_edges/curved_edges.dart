import 'package:flutter/material.dart';

class UtCustomCurvedEdge extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final leftFirstCurve = Offset(0, size.height - 20);
    final leftSecondCurve = Offset(30, size.height - 20);

    path.quadraticBezierTo(leftFirstCurve.dx, leftFirstCurve.dy,
        leftSecondCurve.dx, leftSecondCurve.dy);

    final middleFirstCurve = Offset(0, size.height - 20);
    final middleSecondCurve = Offset(size.width - 30, size.height - 20);

    path.quadraticBezierTo(middleFirstCurve.dx, middleFirstCurve.dy,
        middleSecondCurve.dx, middleSecondCurve.dy);

    final rightFirstCurve = Offset(size.width, size.height - 20);
    final rightSecondCurve = Offset(size.width, size.height);

    path.quadraticBezierTo(rightFirstCurve.dx, rightFirstCurve.dy,
        rightSecondCurve.dx, rightSecondCurve.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
