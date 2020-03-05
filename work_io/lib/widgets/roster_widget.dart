import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Roster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _nowTime = DateTime.now().add(new Duration(hours: 9));
    final _dateFormat = new DateFormat.Hms();
    var text = _dateFormat.format(_nowTime);
    /*3*/
    return MaterialApp(
      /*4*/
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: Center(
          /*7*/
          child: Text(text),
        ),
      ),
    );
  }
}
