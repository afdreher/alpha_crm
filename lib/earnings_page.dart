import 'package:alphacrm/alpha_drawer.dart';
import 'package:alphacrm/alpha_elevation.dart';
import 'package:alphacrm/clippers.dart';
import 'package:alphacrm/clip_shadow_path.dart';
import 'package:alphacrm/alpha_segmented_control.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'theme.dart';
import 'user_model.dart';

class EarningsPage extends StatefulWidget {
  EarningsPage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _EarningsPageState createState() => _EarningsPageState();
}

class EarningsCell extends StatelessWidget {
  final String title;
  final String value;

  const EarningsCell({Key key, this.title, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          this.title,
          style: earningsLabelStyle,
        ),
        Text(
          this.value,
          style: earningsValueStyle,
        )
      ],
    );
  }
}

class _EarningsPageState extends State<EarningsPage> {
  final currencyFormatter =
      NumberFormat.currency(symbol: "\$", decimalDigits: 0);

  Widget _buildUnimplementedChild(BuildContext context, String title) {
    return Center(
        child: Text(title, style: Theme.of(context).textTheme.subhead));
  }

  Widget _buildTab(BuildContext context, String title) {
    return Tab(
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            title,
            style: actionStyle,
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {String source,
      String direction = "up",
      double scale = 2.0,
      double borderRadius = 4.0,
      EdgeInsets margin}) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 8.0),
      child: AlphaElevation(
        borderRadius: borderRadius,
        direction: direction,
        scale: scale,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shadowColor: controlShadowColor,
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Image.asset(source),
        ),
      ),
    );
  }

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
        centerTitle: true,
        title: Text("EARNINGS", style: titleStyle),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: Theme.of(context).iconTheme,
      ),
      // drawer: AlphaDrawer(),
      body: SafeArea(
        child: Consumer<UserModel>(builder: (context, user, child) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 18.0,
                            height: 18.0,
                            child: Image.asset(
                                "images/icons/magnifying_glass.png",
                                fit: BoxFit.contain),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 6.0),
                            child: Text(
                              "July 1 - 31, 2020",
                              style: actionStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(child: Container()),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Row(
                        children: <Widget>[
                          _buildButton(context,
                              direction: "down",
                              source: "images/icons/pie.png"),
                          _buildButton(context,
                              direction: "up", source: "images/icons/line.png"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Stack(
                  children: <Widget>[
                    FractionallySizedBox(
                      widthFactor: 0.8,
                      heightFactor: 0.8,
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: ClipShadowPath(
                          clipper: RingClipper(fraction: 0.85),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: controlShadowColor,
                              offset: Offset(6, 6),
                              blurRadius: 3.0,
                            ),
                            BoxShadow(
                              color: Color.fromRGBO(250, 250, 254, 1.0),
                              offset: Offset(-6, -6),
                              blurRadius: 3.0,
                            ),
                          ],
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: FractionallySizedBox(
                        widthFactor: 0.7,
                        heightFactor: 0.7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "TOTAL EARNINGS",
                              style: earningsLabelStyle,
                            ),
                            AutoSizeText(
                              currencyFormatter.format(user.totalEarnings),
                              maxLines: 1,
                              style: earningsValueStyle,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AlphaSegmentedControl(
                borderRadius: 10.0,
                scale: 3.0,
                isChildrenSwipeable: true,
                tabBarMargin: EdgeInsets.symmetric(horizontal: 20.0),
                childrenHeight: 200.0, // This has to be calculated
                tabChildren: <Widget>[
                  _buildTab(context, "1 Day"),
                  _buildTab(context, "1 Week"),
                  _buildTab(context, "1 Month"),
                  _buildTab(context, "3 Months"),
                  _buildTab(context, "Year"),
                ],
                children: <Widget>[
                  _buildUnimplementedChild(context, "Nope"),
                  _buildUnimplementedChild(context, "Nada"),
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: GridView.count(
                        padding: const EdgeInsets.all(10.0),
                        shrinkWrap: true,
                        childAspectRatio: 2.0,
                        // Create a grid with 2 columns. If you change the scrollDirection
                        // to horizontal, this produces 2 rows.
                        crossAxisCount: 2,
                        children: <Widget>[
                          EarningsCell(
                            title: "SERVICES / SALES",
                            value: user.servicesToSales.toString(),
                          ),
                          EarningsCell(
                            title: "AVERAGE SALE",
                            value: currencyFormatter.format(user.averageSale),
                          ),
                          EarningsCell(
                            title: "RETURNS",
                            value: currencyFormatter.format(user.returns),
                          ),
                          EarningsCell(
                            title: "DISCOUNTS",
                            value: user.discounts.toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _buildUnimplementedChild(context, "Not yet"),
                  _buildUnimplementedChild(context, "Still no"),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
