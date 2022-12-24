import 'package:flutter/material.dart';

class DolDurmaClipper extends CustomClipper<Path> {
  final double right;
  final double holeRadius;

  DolDurmaClipper({required this.right, required this.holeRadius});

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..arcToPoint(Offset(0, 0), radius: Radius.circular(10), clockwise: true)
      ..lineTo(size.width - right - holeRadius, 0.0)
      ..arcToPoint(
        Offset(size.width - right, 0),
        clockwise: false,
        radius: Radius.circular(1),
      )
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - right, size.height)
      ..arcToPoint(
        Offset(size.width - right - holeRadius, size.height),
        clockwise: false,
        radius: Radius.circular(1),
      );

    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(DolDurmaClipper oldClipper) => true;
}
