import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'alpha_elevation.dart';
import 'theme.dart';

class MainPageButton extends StatelessWidget {
  final String title;
  final Image image;
  final GestureTapCallback onPressed;

  const MainPageButton({Key key, this.title, this.image, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
    Positioned.fill(
        child: FractionallySizedBox(
          alignment: Alignment.topLeft,
          widthFactor: 1.0,
          heightFactor: 0.4,
        child: Container(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 0.0),
          child: AutoSizeText(
            this.title,
            textAlign: TextAlign.left,
            style: mainButtonStyle,
            maxLines: 1,
          ),
        ),
        ),
      ),
    ];
    if (this.image != null) {
      children.insert(
        0,
        Positioned.fill(
            child: FractionallySizedBox(
                alignment: Alignment.bottomRight,
                widthFactor: 100.0 / 180.0,
                heightFactor: 85.0 / 130.0,
                child: FittedBox(
                  alignment: Alignment.bottomRight,
                  fit: BoxFit.contain,
                  child: this.image,
                ))),
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: AlphaElevation(
        direction: "up",
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: 6.0,
        child: FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: onPressed,
          child: Stack(
            children: children,
          ),
        ),
      ),
    );
  }
}
