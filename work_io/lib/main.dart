import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'widgets/clock_widget.dart';
import 'widgets/wallpaper_widget.dart';

void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Clock',
//       theme: ThemeData(
//         primaryColor: Colors.white,
//       ),
//       home: _ClockHomePage(),
//     );
//   }
// }
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BottomNav',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// SingleTickerProviderStateMixinを使用。後述
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // ページ切り替え用のコントローラを定義
  PageController _pageController;

  // ページインデックス保存用
  int _screen = 0;

  // ページ下部に並べるナビゲーションメニューの一覧
  List<BottomNavigationBarItem> myBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: const Text('ホーム'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.assignment),
        title: const Text('勤務表'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.assessment),
        title: const Text('勤務集計'),
      ),
      // BottomNavigationBarItem(
      //   icon: Icon(Icons.settings),
      //   title: const Text('設定'),
      // ),
    ];
  }

  @override
  void initState() {
    super.initState();
    // コントローラ作成
    _pageController = PageController(
      initialPage: _screen, // 初期ページの指定。上記で_screenを１とすれば２番目のページが初期表示される。
    );
  }

  @override
  void dispose() {
    // コントローラ破棄
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      // Appbar
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'BottomNav',
          style: TextStyle(fontSize: 16),
        ),
      ),
      // ),
      // ページビュー
      body: PageView(
          controller: _pageController,
          // ページ切り替え時に実行する処理
          // PageViewのonPageChangedはページインデックスを受け取る
          // 以下ではページインデックスをindexとする
          onPageChanged: (index) {
            setState(() {
              // ページインデックスを更新
              _screen = index;
            });
          },
          // ページ下部のナビゲーションメニューに相当する各ページビュー。後述
          children: [
            _ClockHomePage(),
            BookScreen(),
            // CloudScreen(),
            // CakeScreen(),
          ]),
      // ページ下部のナビゲーションメニュー
      bottomNavigationBar: BottomNavigationBar(
        // 現在のページインデックス
        currentIndex: _screen,
        // onTapでナビゲーションメニューがタップされた時の処理を定義
        onTap: (index) {
          setState(() {
            // ページインデックスを更新
            _screen = index;

            // ページ遷移を定義。
            // curveで指定できるのは以下
            // https://api.flutter.dev/flutter/animation/Curves-class.html
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.easeOut);
          });
        },
        // 定義済のナビゲーションメニューのアイテムリスト
        items: myBottomNavBarItems(),
      ),
    );
  }
}

class _ClockHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 120),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DateWidget(),
              ClockWidget(),
              buttonSection,
            ],
          ),
        ),
      ),
      // Container(child: Center(child: ClockWidget())),
    );
  }

  // @override
  Widget buttonSection = Container(
    child: Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // margin: EdgeInsets.only(top: 5),
          RaisedButton(
            onPressed: kasan,
            color: Colors.green[300],
            child: Text(
              '出勤',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
              ),
            ),
          ),
          RaisedButton(
            onPressed: kasan,
            color: Colors.orange[400],
            child: Text(
              '退勤',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

void kasan() {
  var _test = 1;
  _test += 1;
}

class BookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*3*/
    return MaterialApp(
      /*4*/
      title: 'Welcome to Flutter',
      home: Scaffold(
        /*5*/
        appBar: AppBar(
          /*6*/
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          /*7*/
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
