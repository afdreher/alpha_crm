import 'package:flutter/material.dart';

class AlphaListTile extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;

  const AlphaListTile({Key key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        this.title,
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.display1,
      ),
      onTap: this.onTap,
    );
  }
}