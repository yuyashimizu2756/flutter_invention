import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class ClockWidget extends StatefulWidget {
  ClockWidget({Key key, this.relate}) : super(key: key);
  final double relate;
  @override
  ClockWidgetState createState() => ClockWidgetState();
}

class DateWidget extends StatefulWidget {
  DateWidget({Key key}) : super(key: key);
  @override
  DateWidgetState createState() => DateWidgetState();
}

class DateWidgetState extends State<DateWidget> {
  var _nowDate = DateTime.now().add(new Duration(hours: 9));

  @override
  void initState() {
    initializeDateFormatting('ja_JP');
    super.initState();
    _initDate();
  }

  void _initDate() {
    Timer.periodic(
        Duration(milliseconds: 33),
        (Timer timer) => setState(
            () => _nowDate = DateTime.now().add(new Duration(hours: 9))));
  }

  @override
  Widget build(BuildContext context) {
    final _dateFormat = new DateFormat.yMEd('ja_JP');
    var text = _dateFormat.format(_nowDate);
    var fontSize = MediaQuery.of(context).size.width * 0.05;
    return Stack(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
              fontSize: fontSize,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 0.01
                ..color = Colors.green),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class ClockWidgetState extends State<ClockWidget> {
  var _nowTime = DateTime.now().add(new Duration(hours: 9));
  final _dateFormat = new DateFormat.Hms();

  @override
  void initState() {
    super.initState();
    _initTimer();
  }

  void _initTimer() {
    Timer.periodic(
        Duration(milliseconds: 33),
        (Timer timer) => setState(
            () => _nowTime = DateTime.now().add(new Duration(hours: 9))));
  }

  @override
  Widget build(BuildContext context) {
    var text = _dateFormat.format(_nowTime);
    var fontSize = MediaQuery.of(context).size.width * widget.relate;
    return Stack(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
              fontSize: fontSize,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 0.1
                ..color = Colors.green),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
          ),
        )
      ],
    );
  }
}
