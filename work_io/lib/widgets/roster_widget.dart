import 'package:flutter/material.dart';

class Roster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*3*/
    return MaterialApp(
      /*4*/
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: Center(
          /*7*/
          child: Text('勤務表'),
        ),
      ),
    );
  }
}
