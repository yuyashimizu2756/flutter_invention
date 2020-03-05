import 'package:flutter/material.dart';
import 'package:work_io/widgets/settings_widget.dart';
import 'workAggregation_widget.dart';
import 'clock_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.tealAccent[400],
        margin: EdgeInsets.only(top: 0, bottom: 10),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                DateWidget(),
                ClockWidget(
                  relate: 0.12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.green[300],
                      child: Text(
                        '出勤',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 45.0,
                        ),
                      ),
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      onPressed: test,
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
                      onPressed: test,
                    ),
                  ],
                ),
                // ChangeForm(),
                // ChangeForm(),
                // HomePage(),
                Settings(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void test() {}

// onPressed: () async {
//                         showDialog<int>(
//                           context: context,
//                           barrierDismissible: true,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               shape: const RoundedRectangleBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(20.0))),
//                               title: Text('出勤しました！'),
//                               content: Text('頑張ってください！！'),
//                               actions: <Widget>[
//                                 FlatButton(
//                                   child: Text('OK'),
//                                   onPressed: () => Navigator.of(context).pop(1),
//                                 ),
//                               ],
//                             );
//                           },
//                         );
//                       },
//                     ),
