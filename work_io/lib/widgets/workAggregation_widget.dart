import 'package:flutter/material.dart';

class ChangeForm extends StatefulWidget {
  @override
  _ChangeFormState createState() => _ChangeFormState();
}

class _ChangeFormState extends State<ChangeForm> {
  Widget build(BuildContext context) {
    return Container(
      color: Colors.tealAccent[400],
      padding: const EdgeInsets.all(6),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Text(
            //   "$_text",
            //   style: TextStyle(
            //       color: Colors.blue,
            //       fontSize: 30.0,
            //       fontWeight: FontWeight.w500),
            // ),
            TextField(
              enabled: true,
              // 入力数
              // maxLength: 10,
              maxLengthEnforced: false,
              style: TextStyle(color: Colors.red),
              // obscureText: false,
              maxLines: 1,
              //パスワード
              obscureText: true,
              decoration: InputDecoration(
                focusColor: Colors.grey,
                border: OutlineInputBorder(),
                labelText: '打刻メモ',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
