import 'package:alphacrm/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'alerts.dart';
import 'alpha_drawer.dart';
import 'main_page_button.dart';
import 'user_model.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
      drawer: AlphaDrawer(),
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
                      style: welcomeStyle,
                    ),
                    Consumer<UserModel>(
                      builder: (context, user, child) {
                        return SizedBox(
                          width: double.infinity,
                          child: AutoSizeText(
                            user.name,
                            textAlign: TextAlign.left,
                            style: nameStyle,
                            maxLines: 1,
                          ),
                        );
                      },
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
                    notImplemented(context);
                  },
                ),
                MainPageButton(
                  title: "Earnings",
                  image: Image.asset("images/earnings.png"),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/earnings');
                  },
                ),
                MainPageButton(
                  title: "Add Service",
                  image: Image.asset("images/add_service.png"),
                  onPressed: () {
                    notImplemented(context);
                  },
                ),
                MainPageButton(
                  title: "Book Service",
                  image: Image.asset("images/book_service.png"),
                  onPressed: () {
                    notImplemented(context);
                  },
                ),
                MainPageButton(
                  title: "Calendar",
                  image: Image.asset("images/calendar.png"),
                  onPressed: () {
                    notImplemented(context);
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
