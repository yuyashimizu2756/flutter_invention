import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<Settings> {
  // テキストフィールドを管理するコントローラを作成
  // 入力された内容をこのコントローラを使用して取り出します。
  final myController = TextEditingController();

  // 適当なリスト用データ
  List<Map<String, dynamic>> items = [
    // {"id": 1, "content": "Content 1"},
    // {"id": 2, "content": "Content 2"},
    // {"id": 3, "content": "Content 3"}
  ];

  //　上記リスト用IDカウンター
  int _counter = 0;

  //　追加ボタンが押されたときに実行する関数
  void _addItem(String inputtext) {
    setState(() {
      _counter++;
      items.add({"id": _counter, "content": inputtext});
    });
  }

  @override
  // widgetの破棄時にコントローラも破棄する
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 30.0,
        top: 10,
        right: 30.0,
        bottom: 10,
      ),
      height: 250,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
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
              borderRadius: new BorderRadius.all(new Radius.circular(5)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                  hintText: '打刻メモ',
                  contentPadding: const EdgeInsets.only(left: 4, bottom: 11),
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
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];

                return new Card(
                  child: ListTile(
                    leading: FlutterLogo(),
                    title:
                        Text(item["id"].toString() + " : " + item["content"]),
                  ),
                );
              },
            ),
          ),
          FloatingActionButton(
            // onPressedでボタンが押された時の動作を渡す
            onPressed: () {
              // myController.text で入力されたテキストフィールドの内容を取得
              // 以下の_addItemは自分で定義済の関数
              _addItem(myController.text);

              // テキストフィールドの内容をクリアする
              myController.clear();
            },
            child: Icon(Icons.add),
          ),
        ],
      ),

      // テキストフィールド送信用ボタン
      // floatingActionButton: FloatingActionButton(
      //   // onPressedでボタンが押された時の動作を渡す
      //   onPressed: () {
      //     // myController.text で入力されたテキストフィールドの内容を取得
      //     // 以下の_addItemは自分で定義済の関数
      //     _addItem(myController.text);

      //     // テキストフィールドの内容をクリアする
      //     myController.clear();
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}

// class Settings extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     /*3*/
//     return MaterialApp(
//       /*4*/
//       title: 'Welcome to Flutter',
//       home: Scaffold(
//         body: Center(
//           /*7*/
//           child: Text('設定'),
//         ),
//       ),
//     );
//   }
// }
