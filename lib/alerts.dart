import 'package:flutter/material.dart';

Future<void> notImplemented(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "Sorry",
          style: Theme.of(context).textTheme.subhead,
        ),
        content: Text(
          'This feature is not yet implemented',
          style: Theme.of(context).textTheme.body1,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Oh well',
              style: Theme.of(context).textTheme.button,
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