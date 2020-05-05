import 'package:flutter/material.dart';
import './user.dart';
import './mainPageButton.dart';
import './alphaListTile.dart';

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
      home: MyHomePage(title: 'Alpha'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final User user = User();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Future<void> _notImplemented(BuildContext context) {
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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Set the app bar to transparent to just have the hamburger button and
        // title
        title: Text(""),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: Theme.of(context).iconTheme,
      ),
      drawer: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: 0.7,
        heightFactor: 1.0,
        child: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
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
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
              AlphaListTile(
                title: "Receive \$",
                onTap: () {
                  _notImplemented(context);
                },
              ),
              AlphaListTile(
                title: "Earnings",
                onTap: () {},
              ),
              AlphaListTile(
                title: "Add Service",
                onTap: () {
                  _notImplemented(context);
                },
              ),
              AlphaListTile(
                title: "Book Service",
                onTap: () {
                  _notImplemented(context);
                },
              ),
              AlphaListTile(
                title: "Calendar",
                onTap: () {
                  _notImplemented(context);
                },
              ),
              AlphaListTile(
                title: "Messages",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 20.0),
                alignment: Alignment.centerLeft,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "WELCOME BACK",
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.display1,
                    ),
                    Text(
                      widget.user.name,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ],
                ),
              ),
            ),
            GridView.count(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              shrinkWrap: true,
              childAspectRatio: 1.4,
              // Create a grid with 2 columns. If you change the scrollDirection
              // to horizontal, this produces 2 rows.
              crossAxisCount: 2,
              children: <Widget>[
                MainPageButton(
                  title: "Receive \$",
                  image: Image.asset("images/receive.png"),
                  onPressed: () {
      _notImplemented(context);
      },
                ),
                MainPageButton(
                  title: "Earnings",
                  image: Image.asset("images/earnings.png"),
                ),
                MainPageButton(
                  title: "Add Service",
                  image: Image.asset("images/add_service.png"),
                  onPressed: () {
                    _notImplemented(context);
                  },
                ),
                MainPageButton(
                  title: "Book Service",
                  image: Image.asset("images/book_service.png"),
                  onPressed: () {
                    _notImplemented(context);
                  },
                ),
                MainPageButton(
                  title: "Calendar",
                  image: Image.asset("images/calendar.png"),
                  onPressed: () {
                    _notImplemented(context);
                  },
                ),
                MainPageButton(
                  title: "Messages",
                  image: Image.asset("images/messages.png"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
