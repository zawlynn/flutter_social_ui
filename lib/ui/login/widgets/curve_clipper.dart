import 'package:flutter/cupertino.dart';

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 4 * size.height / 5);

    Offset one = Offset(size.width / 4, size.height);
    Offset center = Offset(size.width / 2, 4 * size.height / 5);
    path.quadraticBezierTo(one.dx, one.dy, center.dx, center.dy);

    Offset two = Offset(3 * size.width / 4, 3 * size.height / 5);
    Offset end = Offset(size.width, 4 * size.height / 5);

    path.quadraticBezierTo(two.dx, two.dy, end.dx, end.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
