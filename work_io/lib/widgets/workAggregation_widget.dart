import 'package:flutter/material.dart';
import 'package:work_io/widgets/settings_widget.dart';

class ChangeForm extends StatefulWidget {
  @override
  _ChangeFormState createState() => _ChangeFormState();
}

class _ChangeFormState extends State<ChangeForm> {
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
              left: 30.0,
              top: 10,
              right: 30.0,
              bottom: 10,
            ),
            height: 19,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.all(new Radius.circular(5)),
            ),
            // child: SingleChildScrollView(
            child: new Directionality(
              textDirection: TextDirection.ltr,
              child: new TextField(
                controller: null,
                autofocus: false,
                style: new TextStyle(fontSize: 15.0, color: Colors.black),
                decoration: new InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '打刻メモ',
                  contentPadding: const EdgeInsets.only(left: 4, bottom: 11),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
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
        ],
      ),
    );
  }
}
