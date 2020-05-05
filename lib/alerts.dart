import 'package:flutter/material.dart';

Future<void> notImplemented(BuildContext context) {
  final textTheme = Theme.of(context).textTheme;
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "Sorry",
          style: textTheme.subhead,
        ),
        content: Text(
          'This feature is not yet implemented',
          style: textTheme.display1,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Oh well',
              style: textTheme.display1,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        elevation: 24.0,
      );
    },
  );
}