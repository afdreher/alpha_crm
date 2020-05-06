import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'earnings_page.dart';
import 'main_page.dart';
import 'theme.dart';
import 'user_model.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => UserModel(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alpha CRM Demo',
      routes: {
        '/': (context) => MainPage(),
        '/earnings': (context) => EarningsPage(),
      },
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.lightBlue,
        accentColor: mediumBlue,
        scaffoldBackgroundColor: backgroundBlue,
        textTheme: TextTheme(
          subhead: mainButtonStyle,
          body1: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
            color: purpleTextColor,
          ),
          button: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
            color: purpleTextColor,
          ),
        ),
        iconTheme: IconThemeData(
          color: mediumBlue,
        ),
      ),
    );
  }
}
