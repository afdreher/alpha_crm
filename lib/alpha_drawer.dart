import 'package:flutter/material.dart';

import 'alerts.dart';
import 'alpha_list_tile.dart';

class AlphaDrawer extends StatelessWidget {
  void _pushRoute(BuildContext context, String routeName) {
    Navigator.of(context).pop();
    if (ModalRoute.of(context).settings.name != routeName) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(routeName, ModalRoute.withName('/'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.centerLeft,
      widthFactor: 0.7,
      heightFactor: 1.0,
      child: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: FlatButton(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: Image.asset(
                          "images/logo.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Text(
                      "Alpha",
                      style: Theme.of(context).textTheme.subhead,
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).popUntil(ModalRoute.withName('/'));
                },
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            AlphaListTile(
              title: "Receive \$",
              onTap: () {
                notImplemented(context);
              },
            ),
            AlphaListTile(
              title: "Earnings",
              onTap: () {
                _pushRoute(context, '/earnings');
              },
            ),
            AlphaListTile(
              title: "Add Service",
              onTap: () {
                notImplemented(context);
              },
            ),
            AlphaListTile(
              title: "Book Service",
              onTap: () {
                notImplemented(context);
              },
            ),
            AlphaListTile(
              title: "Calendar",
              onTap: () {
                notImplemented(context);
              },
            ),
            AlphaListTile(
              title: "Messages",
              onTap: () {
                _pushRoute(context, '/messages');
              },
            ),
          ],
        ),
      ),
    );
  }
}
