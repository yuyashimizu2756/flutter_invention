import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'clock_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myController = TextEditingController();

  List<Map<String, dynamic>> items = [
    // {"id": 1, "content": "Content 1"},
    // {"id": 2, "content": "Content 2"},
    // {"id": 3, "content": "Content 3"}
  ];
  List<Map<String, dynamic>> lists = [];
  var _pushTime = DateTime.now().add(new Duration(hours: 9));
  final _pushTimeFormat = new DateFormat.Hm();
  var _pushDate = DateTime.now().add(new Duration(hours: 9));

  int _counter = 0;

  void addItem(String inputtext) {
    initializeDateFormatting('ja_JP');
    final _pushDateFormat = new DateFormat.MEd('ja_JP');
    _pushTime = DateTime.now().add(new Duration(hours: 9));
    _pushDate = DateTime.now().add(new Duration(hours: 9));
    setState(() {
      _counter++;
      items.add({
        "id": _counter,
        "content": inputtext,
        "time": _pushTimeFormat.format(_pushTime),
        "date": _pushDateFormat.format(_pushDate),
      });
    });
    lists = items.reversed.toList();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.tealAccent[400],
        margin: EdgeInsets.only(top: 0, bottom: 0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                DateWidget(),
                ClockWidget(relate: 0.12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.green[300],
                      child: Text(
                        '出勤',
                        style: TextStyle(color: Colors.white, fontSize: 45.0),
                      ),
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      onPressed: () {
                        addItem("出勤  " + myController.text);
                        myController.clear();
                      },
                    ),
                    RaisedButton(
                      color: Colors.orange[400],
                      child: Text(
                        '退勤',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 45.0,
                        ),
                      ),
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      onPressed: () {
                        addItem("退勤  " + myController.text);
                        myController.clear();
                      },
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 0,
                    top: 0,
                    right: 0,
                    bottom: 0,
                  ),
                  height: 320,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(
                          left: 10.0,
                          top: 10,
                          right: 10.0,
                          bottom: 10,
                        ),
                        height: 21,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(5)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: TextField(
                            controller: myController,
                            decoration: InputDecoration(
                              hintText: '打刻メモ',
                              contentPadding:
                                  const EdgeInsets.only(left: 4, bottom: 11),
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black),
                                borderRadius: new BorderRadius.circular(5),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: ListView.builder(
                            // reverse: true,
                            scrollDirection: Axis.vertical,
                            // primary: true,
                            shrinkWrap: true,
                            itemCount: lists.length,
                            itemBuilder: (BuildContext context, int index) {
                              final item = lists[index];

                              return new Card(
                                child: ListTile(
                                  dense: true,
                                  // leading: FlutterLogo(),
                                  title: Text(
                                    item["date"] +
                                        "    " +
                                        item["time"] +
                                        "    " +
                                        item["content"],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
