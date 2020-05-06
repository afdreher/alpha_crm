import 'package:flutter/material.dart';

class AlphaElevation extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final String direction;
  final double scale;

  final Color backgroundColor;
  final Color highlightColor;
  final Color shadowColor;

  AlphaElevation({@required this.child,
    this.borderRadius = 0.0,
    this.direction = "up",
    this.scale = 2.0,
    this.backgroundColor,
    this.highlightColor = const Color.fromRGBO(232, 241, 247, 0.9),
    this.shadowColor = const Color.fromRGBO(193, 210, 226, 0.9),
  })
      : assert(child != null);

  List<BoxShadow> _buildBoxShadow(BuildContext context) {
    final lightOffset = this.direction == "up" ? -this.scale : this.scale;
    final darkOffset = -lightOffset;

    return <BoxShadow>[
      BoxShadow(
        color: this.highlightColor,
        //blurRadius: 1,
        offset: Offset(lightOffset, lightOffset),
      ),
      BoxShadow(
        color: Color.fromRGBO(193, 210, 226, 0.9),
        //blurRadius: 1,
        offset: Offset(darkOffset, darkOffset),
      ),
    ];
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    final Color color = this.backgroundColor ??  Theme.of(context).backgroundColor;
    if (this.borderRadius > 0.0) {
      return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(this.borderRadius)),
        boxShadow: _buildBoxShadow(context),
      );
    } else {
      return BoxDecoration(
        color: color,
        boxShadow: _buildBoxShadow(context),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildDecoration(context),
      child: this.child,
    );
  }
}
