import 'package:flutter/material.dart';

import 'main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Color textPurple = Color.fromRGBO(46, 10, 86, 1.0);
  final Color backgroundBlue = Color.fromRGBO(221, 233, 243, 1.0);
  final Color accentBlue = Color.fromRGBO(202, 221, 239, 1.0);
  final Color mediumBlue = Color.fromRGBO(54, 76, 114, 1.0);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alpha CRM Demo',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.lightBlue,
        accentColor: Colors.deepPurple,
        scaffoldBackgroundColor: backgroundBlue,
        textTheme: TextTheme(
          headline: TextStyle(
            fontSize: 80.0,
            fontWeight: FontWeight.bold,
            color: textPurple,
          ),
          subhead: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w800,
            color: textPurple,
          ),
          display1: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
            color: textPurple,
          ),
          display2: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
            color: textPurple,
          ),
        ),
        iconTheme: IconThemeData(
          color: mediumBlue,
        ),
      ),
      home: MainPage(title: 'Alpha'),
    );
  }
}