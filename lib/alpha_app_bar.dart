import 'package:flutter/material.dart';

import 'theme.dart';

class AlphaAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;

  AlphaAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0.0,
      iconTheme: Theme.of(context).iconTheme,
      title: Text(this.title.toUpperCase(), style: titleStyle),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}