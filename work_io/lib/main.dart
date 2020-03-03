import 'package:flutter/material.dart';
import 'widgets/clock_widget.dart';

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  PageController _pageController;

  int _screen = 0;

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
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        title: const Text('設定'),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _screen, // 初期ページの指定。上記で_screenを１とすれば２番目のページが初期表示される。
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          '勤務管理',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _screen = index;
            });
          },
          children: [
            _ClockHomePage(),
            BookScreen(),
            // CloudScreen(),
            // CakeScreen(),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _screen,
        onTap: (index) {
          setState(() {
            _screen = index;

            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.easeOut);
          });
        },
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
            children: <Widget>[
              DateWidget(),
              ClockWidget(
                relate: 0.18,
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
                        fontSize: 50.0,
                      ),
                    ),
                    onPressed: () async {
                      showDialog<int>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            title: Text('出勤しました！'),
                            content: Text('頑張ってください！！'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('OK'),
                                onPressed: () => Navigator.of(context).pop(1),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  RaisedButton(
                    color: Colors.orange[400],
                    child: Text(
                      '退勤',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                      ),
                    ),
                    onPressed: () async {
                      showDialog<int>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            title: Text('退勤しました'),
                            content: Text('お疲れ様です！！'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('OK'),
                                onPressed: () => Navigator.of(context).pop(1),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
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
