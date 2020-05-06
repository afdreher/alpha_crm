import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'earnings_page.dart';
import 'main_page.dart';
import 'user_model.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => UserModel(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  final Color textPurple = const Color.fromRGBO(46, 10, 86, 1.0);
  final Color backgroundBlue = const Color.fromRGBO(221, 233, 243, 1.0);
  final Color accentBlue = const Color.fromRGBO(202, 221, 239, 1.0);
  final Color mediumBlue = const Color.fromRGBO(54, 76, 114, 1.0);

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
          display3: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: mediumBlue,
          ),
          display4: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
            color: mediumBlue,
          ),
        ),
        iconTheme: IconThemeData(
          color: mediumBlue,
        ),
      ),
    );
  }
}
