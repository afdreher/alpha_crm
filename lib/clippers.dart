import 'dart:math';

import 'package:flutter/material.dart';

class RingClipper extends CustomClipper<Path> {
  final double fraction;

  const RingClipper({Listenable reclip, this.fraction = 0.7})
      : super(reclip: reclip);

  @override
  Path getClip(Size size) {
    final _radius = min(size.width, size.height) * 0.5;
    final _half = size / 2;
    final _center = Offset(_half.width, _half.height);

    return Path.combine(
        PathOperation.difference,
        Path()..addOval(Rect.fromCircle(center: _center, radius: _radius)),
        Path()
          ..addOval(
              Rect.fromCircle(center: _center, radius: _radius * fraction))
          ..close());
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final _radius = min(size.width, size.height) * 0.5;

    return Path()
      ..addOval(Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2), radius: _radius))
      ..fillType = PathFillType.nonZero;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class InvertedCircleClipper extends CustomClipper<Path> {
  final double fraction;

  const InvertedCircleClipper({Listenable reclip, this.fraction})
      : super(reclip: reclip);

  @override
  Path getClip(Size size) {
    return new Path()
      ..addOval(Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width * 0.5 * fraction))
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}