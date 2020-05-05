import 'package:flutter/material.dart';

class AlphaElevation extends StatelessWidget {
  final Widget child;

  AlphaElevation({@required this.child}) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(193, 210, 226, 0.9),
            blurRadius: 1,
            offset: Offset(2, 2),
          ),
          BoxShadow(
            color: Color.fromRGBO(232, 241, 247, 0.9),
            blurRadius: 1,
            offset: Offset(-2, -2),
          ),
        ],
      ),
      child: this.child,
    );
  }
}