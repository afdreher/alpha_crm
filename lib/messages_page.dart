import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'alpha_app_bar.dart';
import 'clippers.dart';
import 'theme.dart';

class Circle extends StatelessWidget {
  final double radius;
  final Widget child;

  Circle({key, this.radius, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 2.0 * this.radius,
      height: 2.0 * this.radius,
      child: ClipPath(
        child: this.child,
        clipper: CircleClipper(),
      ),
    );
  }
}

class CircularProfile extends StatelessWidget {
  final Widget child;
  final String badge;
  final double radius;

  CircularProfile({key, this.child, this.radius, this.badge}) : super(key: key);

  Widget _badgeText(BuildContext context) {
    if (this.badge != null) {
      return FractionallySizedBox(
        widthFactor: 0.8,
        heightFactor: 0.8,
        child: Center(
          child: AutoSizeText(
            this.badge,
            style: badgeStyle,
            maxLines: 1,
            minFontSize: 4.0,
          ),
        ),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];

    // Create main circle
    items.add(Positioned.fill(
      child: Circle(
        radius: this.radius,
        child: this.child,
      ),
    ));

    // Add the badge, if available
    if (this.badge != null) {
      items.add(Positioned(
        top: (this.radius * 1.3),
        left: (this.radius * 1.3),
        child: Circle(
          radius: (this.radius * .35),
          child: Container(
            color: Colors.blueAccent,
            child: _badgeText(context),
          ),
        ),
      ));
    }

    return SizedBox(
      width: 2.0 * this.radius,
      height: 2.0 * this.radius,
      child: Stack(children: items),
    );
  }
}

class MessagesPage extends StatefulWidget {
  MessagesPage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class MessageModel {
  final String firstName;
  final String lastName;
  final String message;
  final String badge;

  MessageModel({this.firstName, this.lastName, this.message, this.badge});

  String name() {
    return "$firstName $lastName";
  }

  String initials() {
    return "${firstName[0]}${lastName[0]}";
  }

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      firstName: json['user']['first_name'],
      lastName: json['user']['last_name'],
      message: json['message'],
      badge: json['badge'],
    );
  }
}

class _MessagesPageState extends State<MessagesPage> {
  TextEditingController _searchController;
  StreamController<List<MessageModel>> _messagesController;

  List<MessageModel> _messages = [];

  // Items list is represented as a stream, so it can be dynamic.  If there are
  // no items, then say nothing or loading, as appropriate.
  Widget messagesWidget() {
    return StreamBuilder(
        stream: _messagesController.stream,
        builder:
            (BuildContext context, AsyncSnapshot<List<MessageModel>> snapshot) {
          if (snapshot.hasData) {
            return messageList(snapshot: snapshot);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("Fetching!"));
          }
          return Text("Nothing!");
        });
  }

  Widget messageList({AsyncSnapshot<List<MessageModel>> snapshot}) {
    if (snapshot.data.length > 0) {
      return ListView.separated(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircularProfile(
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(color: purpleTextColor),
                    ),
                    Positioned.fill(
                      child: FractionallySizedBox(
                        widthFactor: 0.8,
                        heightFactor: 0.8,
                        child: Center(
                          child: AutoSizeText(
                            snapshot.data[index].initials(),
                            style: initialsStyle,
                            maxLines: 1,
                            minFontSize: 8.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                radius: 20.0,
                badge: snapshot.data[index].badge,
              ),
              SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(snapshot.data[index].name(), style: messageNameStyle),
                  Text(snapshot.data[index].message, style: messageBodyStyle)
                ],
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      );
    } else {
      return Text("No matches");
    }
  }

  Future<void> loadMessages() async {
    String data =
        await DefaultAssetBundle.of(context).loadString("data/messages.json");
    final jsonResult = json.decode(data);
    final objects = jsonResult['results']
        .map((model) => MessageModel.fromJson(model))
        .toList();
    _messages = List<MessageModel>.from(objects);
    _messagesController.sink.add(_messages);
  }

  void initState() {
    super.initState();
    _messagesController = StreamController<List<MessageModel>>.broadcast();
    _searchController = TextEditingController();
    loadMessages();
  }

  void dispose() {
    _messagesController.close();
    _searchController.dispose();
    super.dispose();
  }

  void _searchItems(String searchQuery) {
    List<MessageModel> searchResult = [];
    _messagesController.sink.add(null);
    print('Total items = ${_messages.length}');
    if (searchQuery.isEmpty) {
      _messagesController.sink.add(_messages);
      return;
    }
    _messages.forEach((message) {
      final query = searchQuery.toLowerCase();
      if (message.name().toLowerCase().contains(query) ||
          message.message.toLowerCase().contains(query)) {
        searchResult.add(message);
      }
    });
    print("Search items = ${searchResult.length}");
    _messagesController.sink.add(searchResult);
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
      appBar: AlphaAppBar(title: "messages"),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 6.0),
                            child: SizedBox(
                              width: 18.0,
                              height: 18.0,
                              child: Image.asset(
                                  "images/icons/magnifying_glass.png",
                                  fit: BoxFit.contain),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search',
                                hintStyle: actionStyle,
                              ),
                              style: actionStyle,
                              onChanged: (searchQuery) =>
                                  _searchItems(searchQuery),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 6.0),
                          child: Text(
                            "New",
                            style: actionStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: messagesWidget(),
              ),
//              child: ListView.separated(
//                itemCount: _items.length,
//                itemBuilder: (context, index) {
//                  return _filter == null || _filter == ""
//                      ? Text(_items[index])
//                      : _items[index].contains(_filter)
//                          ? Text(_items[index])
//                          : Container();
//                },
//                separatorBuilder: (context, index) {
//                  return Divider();
//                },
//              ),

//                    return ListTile(
//                      title: Text(
//                        _items[index],
//                        style: Theme.of(context).textTheme.body1,
//                      ),
//                    );
//                  },
//                  separatorBuilder: (context, index) {
//                    return Divider();
//                  },
//                )),
            ),
          ],
        ),
      ),
    );
  }
}
