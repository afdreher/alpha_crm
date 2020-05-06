import 'package:flutter/material.dart';

@immutable
class ClipShadowPath extends StatelessWidget {
  final List<BoxShadow> boxShadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  ClipShadowPath({
    @required this.boxShadow,
    @required this.clipper,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowShadowPainter(
        clipper: this.clipper,
        boxShadow: this.boxShadow,
      ),
      child: ClipPath(child: child, clipper: this.clipper),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final List<BoxShadow> boxShadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({@required this.boxShadow, @required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    boxShadow.forEach((shadow) {
      var paint = shadow.toPaint();
      var clipPath = clipper.getClip(size).shift(shadow.offset);
      canvas.drawPath(clipPath, paint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}